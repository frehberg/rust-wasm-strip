
## This scripts requires the tools being in your PATH
##
## EmScripten Tools wasm-dis & wasm-opt
##   From https://github.com/juj/emsdk
##   Specific Tools:
##   wasm-dis: Un-assembles WebAssembly in binary format into text format
##             (going through Binaryen IR).
##   wasm-opt: Loads WebAssembly and runs Binaryen IR passes on it.
## 
## Tool wasm-gc
##   cargo install --git https://github.com/alexcrichton/wasm-gc
##
## Tool wasm-snip
##   cargo install wasm-snip

EMSDK_HOME=/home/frehberg/tools/emsdk-portable
BINARYEN_HOME=$(EMSDK_HOME)/clang/e1.37.16_64bit/binaryen
WASM_BUILD_FILE=target/wasm32-unknown-unknown/release/transform.wasm
WASM_FILE=transform.wasm
WAST_FILE=transform.wast

SHELL=/bin/bash

all: wasm wast

wasm:
	cargo +nightly build --release --target wasm32-unknown-unknown
	cp $(WASM_BUILD_FILE) $(WASM_FILE)
	wasm-gc  $(WASM_FILE)
	. $(EMSDK_HOME)/emsdk_env.sh; $(BINARYEN_HOME)/bin/wasm-opt  $(WASM_FILE)
	wasm-gc  $(WASM_FILE)

wast: wasm
	. $(EMSDK_HOME)/emsdk_env.sh; $(BINARYEN_HOME)/bin/wasm-dis $(WASM_FILE) > $(WAST_FILE)

clean:
	cargo clean
	rm -f $(WASM_FILE) $(WAST_FILE)
	
