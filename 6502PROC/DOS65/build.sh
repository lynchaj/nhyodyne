ca65 DOS65.ASM -l DOS65.LST
ld65 DOS65.o -m DOS65.MAP -C dos65.cfg -o DOS65.out
srec_cat  DOS65.out -binary -offset 0x0100 -exclude 0x0000 0xB800 -o  DOS65.s -data-only
srec_cat  DOS65.out -binary -offset 0x0100 -exclude 0x0000 0xB7F3 -exclude 0xD500 0xFFFF -o  DOS65.s19 -data-only
srec_cat  DOS65.s  -offset -0x8000  -o  DOS651.s -data-only
srec_cat  DOS651.s -exclude 0x6000 0x7EE0  -o DOS65.hex  -intel -address-length=2
srec_cat  DOS65.out -binary -exclude 0x0000 0xB7E0 -o  DOS65A.s -data-only
srec_cat  DOS65A.s  -offset -0xB7E0  -o  DOS652.s -data-only
srec_cat  DOS652.s -o DOS65.COM  -BINARY
rm DOS65.s
rm DOS65A.s
rm DOS651.s
rm DOS652.s
rm DOS65.out
rm DOS65.o
