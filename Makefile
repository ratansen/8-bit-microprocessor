COMPUTER    = $(wildcard hdl/*.v)
LIBRARIES   = $(wildcard test/tb_top.v)

build:
	iverilog -o computer -Wall \
		$(COMPUTER) \
		$(LIBRARIES) 

run: build
	vvp -n computer

clean:
	rm -rf computer

view:
	gtkwave machine.vcd gtkwave/config.gtkw

tests:
	bats tests/tests.bats

.PHONY: build run clean view tests
