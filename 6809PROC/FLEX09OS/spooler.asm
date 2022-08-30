        NAM     SPOOLER.TXT
        OPT     pag
*       LEN     96
        PAG
        PRAGMA CD

;___________________________________________________________________________________________________________
;
;       FLEX Spooler STUB (No spooler support on Nhyodyne)
;
;       DWERNER 8/14/2022
;___________________________________________________________________________________________________________

                ORG $C700               ; JUMP TABLE STARTS AT $C700

PRSPLI          FCB $39,$39,$39         ; REPLACE THE FIRST BYTE
PRSPL2          FCB $39,$39,$39         ; OF EACH ENTRY WITH AN
PRSPL3          FCB $39,$39,$39         ; RTS ($39) AND THE SECOND
PRSPL4          FCB $39,$39,$39         ; TWO BYTES WITH ANYTHING
PRSPL5          FCB $39,$39,$39
PRSPL6          FCB $39,$39,$39

                ORG $C71B               ; QUEUE COUNT IS AT $C71B
QCNT            FCB 0                   ; FORCE QUEUE COUNT TO ZERO
