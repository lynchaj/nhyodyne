#include "esplowlevel.h"
#include "espui.h"
#include "testesp.h"

play_string_test()
{
    char *test = "A4 4 2 A4 4 2 A#4 4 2 C5 4 2 C5 4 2 A#4 4 2 A4 4 2 G4 4 2 F4 4 2 F4 4 2 G4 4 2 A4 4 2 A4 2 2 G4 16 2 G4 2 2 P 8 2";
    char *c =test;
    esp0_outbyte(12);    // send opcode '12'
    while (*c != '\0') esp0_outbyte(*++c);
    esp0_outbyte(0);
    printmessage("Test String Played.");
}
play_sound_test()
{
    struct playsounddata data;
    int tmp;
    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Play Sound on PSG");
    puts("\e[0m");

    printf("\e[11;3HAttack     ->");
    printf("\e[12;3HDecay      ->");
    printf("\e[13;3HSustain    ->");
    printf("\e[14;3HRelease    ->");
    printf("\e[15;3HWave Type  ->           0=Square, 1=Sine, 2=Triangle, 3=Sawtooth, 4=Noise");
    printf("\e[16;3HVolume     ->");
    printf("\e[17;3HDuration   ->");
    printf("\e[18;3HStart Freq.->");
    printf("\e[19;3HEnd Freq.  ->");
    printf("\e[20;3HModifier   ->           0=None, 1=To End, 2=To Relese, 3=To Sustain");

    printf("\e[11;18H\e[1m"); data.attack=getlong();
    printf("\e[12;18H\e[1m"); data.decay=getlong();
    printf("\e[13;18H\e[1m"); data.sustain=getint();
    printf("\e[14;18H\e[1m"); data.release=getlong();
    printf("\e[15;18H\e[1m"); data.wave=getbyte();
    printf("\e[16;18H\e[1m"); data.volume=getint();
    printf("\e[17;18H\e[1m"); data.durationms=getint();
    printf("\e[18;18H\e[1m"); data.freq_start=getint();
    printf("\e[19;18H\e[1m"); data.freq_end=getint();
    printf("\e[20;18H\e[1m");data.modfreq=getbyte();

    esp0_outbyte(13);        // send opcode '13'
    esp0_outstruct(data,sizeof(data));
}
set_volume_test()
{
    int volume;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Master Volume on PSG");
    puts("\e[0m");

    printf("\e[16;3HVolume     ->");

    volume=getint();

    esp0_outbyte(14);        // send opcode '14'
    esp0_outbyte(((unsigned char *)(&volume))[0]);
}
