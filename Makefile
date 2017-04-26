VALA_HEADERS = include/libctrl.h include/libctrl.vapi
VALA_SOURCES = main.vala
VALA_CCOPTS = -X -I./include -X -lctrl
VALA_CFLAGS = --vapidir=./include --pkg=libctrl
DEBUG_PATH = target/debug
RELEASE_PATH = target/release

.PHONY: all
all: debug

.PHONY: debug
debug: VALA_CCOPTS += -X -L$(DEBUG_PATH)
debug: VALA_CFLAGS += -g
debug: $(DEBUG_PATH)/main

.PHONY: release
release: VALA_CCOPTS += -X -L$(RELEASE_PATH)
release: $(RELEASE_PATH)/main

target/%/main: $(VALA_SOURCES) $(VALA_HEADERS) target/%/libctrl.so
	valac -o $@ $(VALA_CFLAGS) $(VALA_CCOPTS) $(VALA_SOURCES)

target/debug/libctrl.so: ctrl/lib.rs
	cargo build

target/release/libctrl.so: ctrl/lib.rs
	cargo build --release

.PHONY: run
run: debug
	LD_LIBRARY_PATH=$(DEBUG_PATH) $(DEBUG_PATH)/main

.PHONY: run-opt
run: release
	LD_LIBRARY_PATH=$(DEBUG_PATH) $(DEBUG_PATH)/main
