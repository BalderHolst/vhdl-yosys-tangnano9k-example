# Tangnano 9k VHDL Example
This is a minimal example of synthesizing [vhdl](https://en.wikipedia.org/wiki/VHDL) and uploading it to a tangnano 9k board.

### Prerequisites
- [yosys](https://github.com/YosysHQ/yosys)
- [ghdl-yosys-plugin](https://github.com/ghdl/ghdl-yosys-plugin)
- [nextpnr](https://github.com/YosysHQ/nextpnr)
- [apycula](https://github.com/YosysHQ/apicula)
- [openFPGALoader](https://github.com/trabucayre/openFPGALoader)

These programs are usually available in your favorite package manager.

### Flashing the Code
Clone the repo and run
```bash
make flash
```
After uploading the code, two leds should be on. When pressing the button, the lit leds should shift left.
