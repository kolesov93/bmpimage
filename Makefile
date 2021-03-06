all: dump lsb test

test: bmpimage.h test.h test.cpp lsb_encoder.h
	g++  -O2 test.cpp -o binaries/test
	./binaries/test

debug_test: bmpimage.h test.h test.cpp
	g++ -g test.cpp -o test
	gdb test

block: block.h block.cpp block_decoder.cpp block_decoder.h
	g++ -O2 block.cpp -o binaries/block_encoder
	g++ -O2 block_decoder.cpp -o binaries/block_decoder

pseudo: pseudo.h pseudo.cpp pseudo_decoder.cpp pseudo_decoder.h
	g++ -O2 pseudo.cpp -o binaries/pseudo_encoder
	g++ -O2 pseudo_decoder.cpp -o binaries/pseudo_decoder

lsb: lsb_encoder.h lsb_decoder.h lsb_encoder.cpp lsb_decoder.cpp
	g++ -O2 lsb_encoder.cpp -o binaries/lsb_encoder
	g++ -O2 lsb_decoder.cpp -o binaries/lsb_decoder

debug_lsb:
	g++ -g lsb_encoder.cpp -o binaries/lsb_encoder
	g++ -g lsb_decoder.cpp -o binaries/lsb_decoder

dump: dump.cpp bmpimage.h
	g++ -O2 dump.cpp -o binaries/dump 

clean:
	rm -rf binaries *\.gch *\.dSYM

