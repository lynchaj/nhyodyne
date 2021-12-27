Andrew,

Enclosed are:

HDM80.MAC    - Hardward Debug Monitor for 8080 (no RAM)
  Use this to get your hardware up and running, it should be
  already configured for the NorthStar console - but I only
  tested under my simulator, so it's possible I missed something
  in the init. You can use the polling pattern of accesses to
  the UART to debug the console, and once you can talk to it,
  you should be well on your way to getting the system up and
  running.
  - You will need to set the ORG at the beginning to the reset
    vector you have configured on the N* card

MONVEC.ASM   - Monitor I have installed in my Vector 1+
  This is a "full up" 8080/8085 debug monitor with the ability to
  load and execute code, disassemble, breakpoints, single-step
  etc. It may be handy once you get console/RAM working if you
  want to download larger test programs.
  - You will need to modify I/O for the horizon (just copy from above)
  - You will need to set the EQU's at the beginning for your memory
    layout and start address.

MON85.TXT - Some docs on MONVEC

MACRO.EXE - Macro preprocessor you need to assemble HDM80
ASM85.EXE - My 8085 assembler

Dave
