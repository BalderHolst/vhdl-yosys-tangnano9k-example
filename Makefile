# See:
# - [Route and Upload](https://github.com/YosysHQ/nextpnr?tab=readme-ov-file)
#   [GHDL](https://github.com/ghdl/ghdl)
# - [GHDL frontend for yosys](https://github.com/ghdl/ghdl-yosys-plugin)

# Replace with the name of the main VHDL entity
main=leds

# If the GHDL is installed as a module, set the path to the module
# ghdl-module=-m path/to/ghdl.so

make: build/$(main)_packed.fs

build/:
	mkdir build

build/$(main).json: build/
	ghdl -a *.vhdl

	yosys $(ghdl-module) -p 'ghdl $(main); synth_gowin -json build/$(main).json'

build/pnr_$(main).json: build/$(main).json tangnano9k.cst
	nextpnr-gowin --threads 8  --cst "./tangnano9k.cst" --device 'GW1NR-LV9QN88PC6/I5' --write "build/pnr_$(main).json" --json "build/$(main).json"

build/$(main)_packed.fs: build/pnr_$(main).json

	# Generate bitstream
	gowin_pack -d GW1N-9C -o build/$(main)_packed.fs build/pnr_$(main).json

flash: build/$(main)_packed.fs
	sudo openFPGALoader -b tangnano9k build/$(main)_packed.fs
