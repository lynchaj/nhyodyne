#include <Arduino.h>
#include <fabgl.h>



#define RD          13
#define WR          36
#define OUTCLK      26
#define INCLK       27
#define OUTDATA     16
#define INDATA      17

fabgl::VGATextController DisplayController;
fabgl::Terminal          Terminal;

// Setup Brain-dead simple ring buffers.  This should probably include mutexes, but I am going to skip for now.
static volatile uint8_t tx_ring[256];
static volatile uint8_t rx_ring[256];
static volatile uint8_t tx_wpointer=0;
static volatile uint8_t rx_wpointer=0;
static volatile uint8_t tx_rpointer=0;
static volatile uint8_t rx_rpointer=0;


void IRAM_ATTR WRISR();
void IRAM_ATTR RDISR();

void setup() {

  disableCore0WDT();
  delay(100); // experienced crashes without this delay!
  disableCore1WDT();

  DisplayController.begin();
  DisplayController.setResolution();

  Terminal.begin(&DisplayController);
  Terminal.enableCursor(true);

  Terminal.write("\e[40;92m"); // background: black, foreground: green
  Terminal.write("\e[2J");     // clear screen
  Terminal.write("\e[1;1H");   // move cursor to 1,1

    Serial.begin(115200);
    printf("MONITOR\n\r");
    delay(2000);

    pinMode(WR, INPUT);
    pinMode(RD, INPUT);
    pinMode(OUTCLK, OUTPUT);
    pinMode(INCLK, OUTPUT);
    pinMode(OUTDATA, OUTPUT);
    pinMode(INDATA, INPUT);

    digitalWrite(OUTCLK, LOW);
    digitalWrite(INCLK, LOW);
    digitalWrite(OUTDATA, LOW);

    attachInterrupt(WR, WRISR, FALLING);
    attachInterrupt(RD, RDISR, FALLING);
}

void loop() {

    if(rx_wpointer!=rx_rpointer)
    {
        Terminal.write(rx_ring[rx_rpointer++]);
        tx_ring[tx_wpointer++]=rx_ring[rx_rpointer++];
    }
}

    void IRAM_ATTR WRISR()
    {
        uint8_t result;

        for(int x=0;x<8;x++)
        {
                digitalWrite(INCLK, LOW);
                result=result<<1;
                result+=digitalRead(INDATA);
                digitalWrite(INCLK, HIGH);
        }
        rx_ring[rx_wpointer]=result;
        rx_wpointer++;
        digitalWrite(INCLK, LOW);
    }

     void IRAM_ATTR RDISR()
    {
        uint8_t result=0;

        if(rx_wpointer!=rx_rpointer)
        {
            result=tx_ring[tx_rpointer++];
        }

        for(int x=0;x<8;x++)
        {
                digitalWrite(OUTDATA,(result & 128));
                digitalWrite(OUTCLK, HIGH);
                result=result<<1;
                digitalWrite(OUTCLK, LOW);
        }
    }
