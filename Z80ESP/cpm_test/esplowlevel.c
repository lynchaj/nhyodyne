

#define ESP0 $9C       // ESP0 IO PORT
#define ESP1 $9D       // ESP1 IO PORT
#define ESP_STATUS $9E // ESP status IO PORT


int esp0_outbyte(char c) __naked
{
    // SEND BYTE TO ESP0
    __asm
    pop bc      //return address
    pop hl      //character to print in l
    push hl
    push bc
    ld a,l      // char to send is now in a
    PUSH AF
    LD C,0
OUTESP0_1:
    INC C
    JP Z,OUTESP0_TIMEOUT
    IN A,(ESP_STATUS)  //GET STATUS
    AND 2               // Is ESP0 BUSY ?
    JP NZ, OUTESP0_1    // IF BUSY WAIT
    POP AF
    OUT(ESP0),A         //SEND BYTE
    LD C,$E0
OUTESP0_2:
    INC C
    JP Z,OUTESP0_3
    IN A,(ESP_STATUS)   // GET STATUS
    AND 2               // Is ESP0 BUSY ?
    JP Z, OUTESP0_2     // IF NOT BUSY WAIT
OUTESP0_3:
    RET
OUTESP0_TIMEOUT:
    POP AF
    RET
    __endasm;
}
int esp0_inbytewait() __naked
{
    // GET BYTE FROM ESP0 (BLOCKING)
    __asm
INESP0_WAIT:
        LD      C,0
INESP0_WAIT_1:
        INC     C
        JP      Z,INESP0_TIMEOUT
        IN      A,(ESP_STATUS)   // GET STATUS
        AND     2                // Is ESP0 BUSY?
        JP      NZ,INESP0_WAIT_1 // IF BUSY, WAIT
        IN      A,(ESP_STATUS)   // GET STATUS
        AND     1                // Is there data?
        JP      Z,INESP0_WAIT_1  // IF NO, BUSY WAIT
        IN      A,(ESP0)         // GET BYTE
        PUSH    AF
        LD      C,$E0
INESP0_WAIT_2:
        INC     C
        JP      Z,INESP0_3
        IN      A,(ESP_STATUS)  // GET STATUS
        AND     2               // Is ESP0 BUSY?
        JP      Z,INESP0_WAIT_2 // IF NOT BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
INESP0_3:
        POP     AF
        LD      L,A
        LD      H,0
        RET
INESP0_TIMEOUT:
        LD      HL,0
        RET
    __endasm;
}
esp0_outstruct(char *data,int len)
{
    for(int x=0;x<len;x++)
        esp0_outbyte(*data++);
}
esp0_outlong(long value)
{
    esp0_outbyte(((unsigned char *)(&value))[0]);  //LSB
    esp0_outbyte(((unsigned char *)(&value))[1]);
    esp0_outbyte(((unsigned char *)(&value))[2]);
    esp0_outbyte(((unsigned char *)(&value))[3]);  //MSB
}
esp0_outint(int value)
{
    esp0_outbyte(((unsigned char *)(&value))[0]);  //LSB
    esp0_outbyte(((unsigned char *)(&value))[1]);  //MSB
}

int esp1_outbyte(char c) __naked
{
    // SEND BYTE TO ESP1
    __asm
    pop bc      //return address
    pop hl      //character to print in l
    push hl
    push bc
    ld a,l      // char to send is now in a
    PUSH AF
    LD C,0
OUTESP1_1:
    INC C
    JP Z,OUTESP1_TIMEOUT
    IN A,(ESP_STATUS)  //GET STATUS
    AND $10               // Is ESP1 BUSY ?
    JP NZ, OUTESP1_1    // IF BUSY WAIT
    POP AF
    OUT(ESP1),A         //SEND BYTE
    LD C,$E0
OUTESP1_2:
    INC C
    JP Z,OUTESP1_3
    IN A,(ESP_STATUS)   // GET STATUS
    AND $10               // Is ESP1 BUSY ?
    JP Z, OUTESP1_2     // IF NOT BUSY WAIT
OUTESP1_3:
    RET
OUTESP1_TIMEOUT:
    POP AF
    RET
    __endasm;
}
int esp1_inbytewait() __naked
{
    // GET BYTE FROM ESP1 (BLOCKING)
    __asm
INESP1_WAIT:
        LD      C,0
INESP1_WAIT_1:
        INC     C
        JP      Z,INESP1_TIMEOUT
        IN      A,(ESP_STATUS)   // GET STATUS
        AND     $10                // Is ESP1 BUSY?
        JP      NZ,INESP1_WAIT_1 // IF BUSY, WAIT
        IN      A,(ESP_STATUS)   // GET STATUS
        AND     8                // Is there data?
        JP      Z,INESP1_WAIT_1  // IF NO, BUSY WAIT
        IN      A,(ESP1)         // GET BYTE
        PUSH    AF
        LD      C,$E0
INESP1_WAIT_2:
        INC     C
        JP      Z,INESP1_3
        IN      A,(ESP_STATUS)  // GET STATUS
        AND     $10               // Is ESP1 BUSY?
        JP      Z,INESP1_WAIT_2 // IF NOT BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
INESP1_3:
        POP     AF
        LD      L,A
        LD      H,0
        RET
INESP1_TIMEOUT:
        LD      HL,0
        RET
    __endasm;
}
esp1_outstruct(char *data,int len)
{
    for(int x=0;x<len;x++)
        esp1_outbyte(*data++);
}
esp1_outlong(long value)
{
    esp1_outbyte(((unsigned char *)(&value))[0]);  //LSB
    esp1_outbyte(((unsigned char *)(&value))[1]);
    esp1_outbyte(((unsigned char *)(&value))[2]);
    esp1_outbyte(((unsigned char *)(&value))[3]);  //MSB
}
esp1_outint(int value)
{
    esp1_outbyte(((unsigned char *)(&value))[0]);  //LSB
    esp1_outbyte(((unsigned char *)(&value))[1]);  //MSB
}
