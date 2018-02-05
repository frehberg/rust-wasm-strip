
EMSDK_HOME=/home/frehberg/tools/emsdk-portable
BINARYEN_HOME=$(EMSDK_HOME)/clang/e1.37.16_64bit/binaryen

SHELL=/bin/bash

%.wasm: %.cpp
	. $(EMSDK_HOME)/emsdk_env.sh; $(EMSDK_HOME)/emscripten/1.37.16/emcc $< -v -O3 -s ONLY_MY_CODE=1 -s WASM=1 -s SIDE_MODULE=1 -o $@

%.wast: %.wasm
	test -f $< 
	test -f `echo "$<" | sed -e 's/.wasm/.cpp/'`
	cat `echo "$<" | sed -e 's/.wasm/.cpp/'` | sed -e 's/^/;; /' > $@
	. $(EMSDK_HOME)/emsdk_env.sh; $(BINARYEN_HOME)/bin/wasm-dis $< >> $@

clean:
	rm -f *.wast *.wasm

all: transform.cpp
	$(MAKE) transform.wasm 
	$(MAKE) transform.wast

