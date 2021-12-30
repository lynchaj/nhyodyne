
all:  	nhyodynelib


nhyodynelib: crt0.s nhyodyne.s
	ca65 crt0.s
	ca65 nhyodyne.s
	ar65 a nhyodyne.lib crt0.o nhyodyne.o

clean:
	@rm -f *.o
	@rm -f *.out
	@rm -f *.com
	@rm -f *.co6
	@rm -f *.map
	@rm -f *.lst
	@rm -f *.hex
	@rm -f *.s19

cleandust:
	@rm -f *.o
	@rm -f *.out
	@rm -f *.map
	@rm -f *.lst
