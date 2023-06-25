#include <fabgl.h>
#include "interface.h"

SoundGenerator       soundGenerator;
SquareWaveformGenerator swg;
static char song_buffer[256];
static uint8_t song_pointer = 0;


enum wavetype { WAVE_SQUARE, WAVE_SINE, WAVE_TRIANGLE, WAVE_SAW, WAVE_NOISE };
enum modfreqmode { MODFREQ_NONE, MODFREQ_TO_END, MODFREQ_TO_RELEASE, MODFREQ_TO_SUSTAIN  };

struct playsounddata
{
  long attack; // time in millis
  long decay; // time in millis
  int sustain; // 0-127 range (over volume)
  long release; // time in millis
  wavetype wave; // square, sine, triangle, saw, noise
  int volume;
  int durationms;
  int freq_start;
  int freq_end;
  modfreqmode modfreq;
};

#define NOTESTEP 1.0594630943593


void soundgeneratorinit()
{
    soundGenerator.setVolume(126);
    soundGenerator.play(true);
    soundGenerator.attach(&swg);
}

void setVolume(uint8_t b)
{
    soundGenerator.setVolume(b);
}

void iPlaySound( void *pvParameters )
{
  playsounddata psd = *(playsounddata *)pvParameters;

  WaveformGenerator *pwave = nullptr;
  if ( psd.wave == WAVE_SQUARE)   pwave = new SquareWaveformGenerator();
  if ( psd.wave == WAVE_SINE)     pwave = new SineWaveformGenerator();
  if ( psd.wave == WAVE_TRIANGLE) pwave = new TriangleWaveformGenerator();
  if ( psd.wave == WAVE_SAW)      pwave = new SawtoothWaveformGenerator();
  if ( psd.wave == WAVE_NOISE)    pwave = new NoiseWaveformGenerator();

  int sustainVolume = psd.sustain * psd.volume / 127;

  soundGenerator.attach( pwave);
  pwave->setVolume( ((psd.attack == 0) ? ( (psd.decay != 0) ? psd.volume : sustainVolume) : 0) );
  pwave->setFrequency( psd.freq_start );
  pwave->enable(true );

  long startTime = millis();

  while ( millis() - startTime < psd.durationms)
  {
    long current = millis() - startTime;

    if ( current < psd.attack ) // ATTACK VOLUME
      pwave->setVolume( (psd.volume * current) / psd.attack );
    else if ( current > psd.attack && current < (psd.attack + psd.decay)) // DECAY VOLUME
      pwave->setVolume( map( current - psd.attack,  0, psd.decay,  psd.volume, sustainVolume ) );
    else if ( current > psd.durationms - psd.release) // RELEASE VOLUME
      pwave->setVolume( map( current - (psd.durationms - psd.release),  0, psd.release,  sustainVolume, 0 ) );
    else
      pwave->setVolume( sustainVolume );


    if ( psd.modfreq != MODFREQ_NONE)
    {
      int maxtime = psd.durationms;
      if      (psd.modfreq == MODFREQ_TO_RELEASE)
        maxtime = (psd.durationms - psd.release); // until release
      else if (psd.modfreq == MODFREQ_TO_SUSTAIN)
        maxtime = (psd.attack + psd.decay); // until sustain

      int f = ((current > maxtime) ? psd.freq_end : (map(current, 0, maxtime, psd.freq_start, psd.freq_end)));
      pwave->setFrequency ( f ) ;
    }
    vTaskDelay(5);
  }

  soundGenerator.detach( pwave);
  pwave->enable( false );
  delete pwave;

  vTaskDelete( NULL );
}


void playSound( playsounddata ps )
{
  // Now set up two tasks to run independently.
  xTaskCreatePinnedToCore( iPlaySound,  "iPlaySound",
                           4096,  // This stack size can be checked & adjusted by reading the Stack Highwater
                           &ps, // sound as parameters
                           3,  // Priority, with 3 (configMAX_PRIORITIES - 1) being the highest, and 0 being the lowest.
                           NULL,
                           1);
}


// note (C,D,E,F,G,A,B) + [#,b] + octave (2..7) + space + tempo (99..1)
// pause (P) + space + tempo (99.1)
char * noteToFreq(char * note, int * freq)
{
  uint16_t NIDX2FREQ[][12] = { {   66,   70,   74,   78,   83,   88,   93,   98,  104,  110,  117,  124 }, // 2
                               {  131,  139,  147,  156,  165,  175,  185,  196,  208,  220,  233,  247 }, // 3
                               {  262,  277,  294,  311,  330,  349,  370,  392,  415,  440,  466,  494 }, // 4
                               {  523,  554,  587,  622,  659,  698,  740,  784,  831,  880,  932,  988 }, // 5
                               { 1046, 1109, 1175, 1245, 1319, 1397, 1480, 1568, 1661, 1760, 1865, 1976 }, // 6
                               { 2093, 2217, 2349, 2489, 2637, 2794, 2960, 3136, 3322, 3520, 3729, 3951 }, // 7
                             };
  uint8_t NNAME2NIDX[] = {9, 11, 0, 2, 4, 5, 7};  // A, B, C, D, E, F, G
  *freq = 0;
  while (*note && *note == ' ')
    ++note;
  if (*note == 0)
    return note;
  int noteIndex = (*note >= 'A' && *note <= 'G' ? NNAME2NIDX[*note - 'A'] : -2); // -2 = pause
  ++note;
  if (*note == '#') {
    ++noteIndex;
    ++note;
  } else if (*note == 'b') {
    --noteIndex;
    ++note;
  }
  int octave = *note - '0';
  ++note;
  if (noteIndex == -1) {
    noteIndex = 11;
    --octave;
  } else if (noteIndex == 12) {
    noteIndex = 0;
    ++octave;
  }
  if (noteIndex >= 0 && noteIndex <= 11 && octave >= 2 && octave <= 7)
    *freq = NIDX2FREQ[octave - 2][noteIndex];
  return note;
}


char * noteToDelay(char * note, int * delayMS)
{
  *delayMS = 0;
  while (*note && *note == ' ')
    ++note;
  if (*note == 0)
    return note;
  int val = atoi(note);
  if (val > 0)
    *delayMS = 1000 / val;
  return note + (val > 9 ? 2 : 1);
}

char * noteToWave(char * note, int * wave)
{
  *wave = 0;
  while (*note && *note == ' ')
    ++note;
  if (*note == 0)
    return note;
  int val = atoi(note);
  if (val > 0)
    *wave = val;
  return note + (val > 9 ? 2 : 1);
}

void play_song(char *m)
{
  while (*m )
  {
    int freq, delms,wave;
    m = noteToFreq(m, &freq);
    m = noteToDelay(m, &delms);
    m = noteToWave(m, &wave);
    playSound (  {250, 189, 120, 256, (wavetype)wave, 127, delms, freq, 0, MODFREQ_NONE} );
    delay(delms);
  }
}


void play_audio_string(uint8_t b)
{
    if (b == 0)
    {
        song_buffer[song_pointer++] = b;
        play_song((char *)&song_buffer);
    }
    else
    {
        song_buffer[song_pointer++] = b;
    }
}

int play_sound_string(uint8_t b)
{
    if (song_pointer < 23)
    {
        song_buffer[song_pointer++] = b;
    }
    else
    {
        song_buffer[song_pointer++] = b;

        playsounddata sd;
        sd.attack=toInt32(song_buffer[0],song_buffer[1],song_buffer[2],song_buffer[3]);  // time in millis
        sd.decay=toInt32(song_buffer[4],song_buffer[5],song_buffer[6],song_buffer[7]);   // time in millis
        sd.sustain=toInt16(song_buffer[8],song_buffer[9]); // 0-127 range (over volume)
        sd.release=toInt32(song_buffer[10],song_buffer[11],song_buffer[12],song_buffer[13]);; // time in millis
        sd.wave=(wavetype)song_buffer[14];    // square, sine, triangle, saw, noise
        sd.volume=toInt16(song_buffer[15],song_buffer[16]);;
        sd.durationms=toInt16(song_buffer[17],song_buffer[18]);;
        sd.freq_start=toInt16(song_buffer[19],song_buffer[20]);;
        sd.freq_end=toInt16(song_buffer[21],song_buffer[22]);;
        sd.modfreq=(modfreqmode)song_buffer[23];
        playSound(sd);
        return 0;
    }
    return 1;
}

void newsong()
{
    song_pointer=0;
}
