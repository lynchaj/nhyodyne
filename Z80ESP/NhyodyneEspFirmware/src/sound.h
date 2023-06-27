#pragma once
#include <Arduino.h>

extern fabgl::SoundGenerator soundGenerator;

class retroSound
{
public:
    void initialize(fabgl::SoundGenerator *soundGenerator);
    void play_audio_string(uint8_t b);
    int play_sound_string(uint8_t b);
    void setVolume(uint8_t b);
    void newsong();

    enum wavetype
    {
        WAVE_SQUARE,
        WAVE_SINE,
        WAVE_TRIANGLE,
        WAVE_SAW,
        WAVE_NOISE
    };
    enum modfreqmode
    {
        MODFREQ_NONE,
        MODFREQ_TO_END,
        MODFREQ_TO_RELEASE,
        MODFREQ_TO_SUSTAIN
    };

    struct playsounddata
    {
        long attack;   // time in millis
        long decay;    // time in millis
        int sustain;   // 0-127 range (over volume)
        long release;  // time in millis
        wavetype wave; // square, sine, triangle, saw, noise
        int volume;
        int durationms;
        int freq_start;
        int freq_end;
        modfreqmode modfreq;
    };

private:
    SoundGenerator *m_soundGenerator;
    SquareWaveformGenerator swg;
    char song_buffer[256];
    uint8_t song_pointer;

    struct soundDataParameter
    {
        uint32_t attack;
        uint32_t decay;
        uint16_t sustain;
        uint32_t release;
        uint8_t wave;
        uint16_t volume;
        uint16_t durationms;
        uint16_t freq_start;
        uint16_t freq_end;
        uint8_t modfreq;
    } __attribute__((packed));

#define NOTESTEP 1.0594630943593
    void playSound(playsounddata ps);
    char *noteToFreq(char *note, int *freq);
    char *noteToDelay(char *note, int *delayMS);
    char *noteToWave(char *note, int *wave);
    void play_song(char *m);
};