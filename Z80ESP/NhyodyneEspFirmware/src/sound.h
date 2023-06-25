#pragma Once

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
