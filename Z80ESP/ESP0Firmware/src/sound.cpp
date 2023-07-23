#include <fabgl.h>
#include "sound.h"

void retroSound::initialize(fabgl::SoundGenerator *soundGenerator)
{
  m_soundGenerator = soundGenerator;
  song_pointer = 0;
  m_soundGenerator->setVolume(126);
  m_soundGenerator->play(true);
  m_soundGenerator->attach(&swg);
}

void retroSound::setVolume(uint8_t b)
{
  m_soundGenerator->setVolume(b);
}

void iPlaySound(void *pvParameters)
{
  retroSound::playsounddata psd = *(retroSound::playsounddata *)pvParameters;

  WaveformGenerator *pwave = nullptr;
  if (psd.wave == retroSound::WAVE_SQUARE)
    pwave = new SquareWaveformGenerator();
  if (psd.wave == retroSound::WAVE_SINE)
    pwave = new SineWaveformGenerator();
  if (psd.wave == retroSound::WAVE_TRIANGLE)
    pwave = new TriangleWaveformGenerator();
  if (psd.wave == retroSound::WAVE_SAW)
    pwave = new SawtoothWaveformGenerator();
  if (psd.wave == retroSound::WAVE_NOISE)
    pwave = new NoiseWaveformGenerator();

  int sustainVolume = psd.sustain * psd.volume / 127;

  soundGenerator.attach(pwave);
  pwave->setVolume(((psd.attack == 0) ? ((psd.decay != 0) ? psd.volume : sustainVolume) : 0));
  pwave->setFrequency(psd.freq_start);
  pwave->enable(true);

  long startTime = millis();

  while (millis() - startTime < psd.durationms)
  {
    long current = millis() - startTime;

    if (current < psd.attack) // ATTACK VOLUME
      pwave->setVolume((psd.volume * current) / psd.attack);
    else if (current > psd.attack && current < (psd.attack + psd.decay)) // DECAY VOLUME
      pwave->setVolume(map(current - psd.attack, 0, psd.decay, psd.volume, sustainVolume));
    else if (current > psd.durationms - psd.release) // RELEASE VOLUME
      pwave->setVolume(map(current - (psd.durationms - psd.release), 0, psd.release, sustainVolume, 0));
    else
      pwave->setVolume(sustainVolume);

    if (psd.modfreq != retroSound::MODFREQ_NONE)
    {
      int maxtime = psd.durationms;
      if (psd.modfreq == retroSound::MODFREQ_TO_RELEASE)
        maxtime = (psd.durationms - psd.release); // until release
      else if (psd.modfreq == retroSound::MODFREQ_TO_SUSTAIN)
        maxtime = (psd.attack + psd.decay); // until sustain

      int f = ((current > maxtime) ? psd.freq_end : (map(current, 0, maxtime, psd.freq_start, psd.freq_end)));
      pwave->setFrequency(f);
    }
    vTaskDelay(5);
  }

  soundGenerator.detach(pwave);
  pwave->enable(false);
  delete pwave;

  vTaskDelete(NULL);
}

void retroSound::playSound(playsounddata ps)
{
  // Now set up two tasks to run independently.
  xTaskCreatePinnedToCore(iPlaySound, "iPlaySound",
                          4096, // This stack size can be checked & adjusted by reading the Stack Highwater
                          &ps,  // sound as parameters
                          3,    // Priority, with 3 (configMAX_PRIORITIES - 1) being the highest, and 0 being the lowest.
                          NULL,
                          1);
}

// note (C,D,E,F,G,A,B) + [#,b] + octave (2..7) + space + tempo (99..1)
// pause (P) + space + tempo (99.1)
char *retroSound::noteToFreq(char *note, int *freq)
{
  uint16_t NIDX2FREQ[][12] = {
      {66, 70, 74, 78, 83, 88, 93, 98, 104, 110, 117, 124},                     // 2
      {131, 139, 147, 156, 165, 175, 185, 196, 208, 220, 233, 247},             // 3
      {262, 277, 294, 311, 330, 349, 370, 392, 415, 440, 466, 494},             // 4
      {523, 554, 587, 622, 659, 698, 740, 784, 831, 880, 932, 988},             // 5
      {1046, 1109, 1175, 1245, 1319, 1397, 1480, 1568, 1661, 1760, 1865, 1976}, // 6
      {2093, 2217, 2349, 2489, 2637, 2794, 2960, 3136, 3322, 3520, 3729, 3951}, // 7
  };
  uint8_t NNAME2NIDX[] = {9, 11, 0, 2, 4, 5, 7}; // A, B, C, D, E, F, G
  *freq = 0;
  while (*note && *note == ' ')
    ++note;
  if (*note == 0)
    return note;
  int noteIndex = (*note >= 'A' && *note <= 'G' ? NNAME2NIDX[*note - 'A'] : -2); // -2 = pause
  ++note;
  if (*note == '#')
  {
    ++noteIndex;
    ++note;
  }
  else if (*note == 'b')
  {
    --noteIndex;
    ++note;
  }
  int octave = *note - '0';
  ++note;
  if (noteIndex == -1)
  {
    noteIndex = 11;
    --octave;
  }
  else if (noteIndex == 12)
  {
    noteIndex = 0;
    ++octave;
  }
  if (noteIndex >= 0 && noteIndex <= 11 && octave >= 2 && octave <= 7)
    *freq = NIDX2FREQ[octave - 2][noteIndex];
  return note;
}

char *retroSound::noteToDelay(char *note, int *delayMS)
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

char *retroSound::noteToWave(char *note, int *wave)
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

void retroSound::play_song(char *m)
{
  while (*m)
  {
    int freq, delms, wave;
    m = noteToFreq(m, &freq);
    m = noteToDelay(m, &delms);
    m = noteToWave(m, &wave);
    playSound({250, 189, 120, 256, (wavetype)wave, 127, delms, freq, 0, MODFREQ_NONE});
    delay(delms);
  }
}

void retroSound::play_audio_string(uint8_t b)
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

int retroSound::play_sound_string(uint8_t b)
{
  if (song_pointer < 23)
  {
    song_buffer[song_pointer++] = b;
  }
  else
  {
    song_buffer[song_pointer++] = b;

    soundDataParameter P = *((soundDataParameter *)&song_buffer);
    playsounddata PD;
    PD.attack = P.attack;
    PD.decay = P.decay;
    PD.sustain = P.sustain;
    PD.release = P.release;
    PD.wave = (wavetype)P.wave;
    PD.volume = P.volume;
    PD.durationms = P.durationms;
    PD.freq_start = P.freq_start;
    PD.freq_end = P.freq_end;
    PD.modfreq = (modfreqmode)P.modfreq;

    playSound(PD);
    return 0;
  }
  return 1;
}

void retroSound::newsong()
{
  song_pointer = 0;
}
