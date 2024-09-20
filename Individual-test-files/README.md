# Explanartion of this directory

## nand_gate.v: file with nand_gate module. I had to add inclusion guards to resolve the error
## nand_tb.v: testing file for nand_gate module. Dumps info for wave form into nand_tb.vcd 
## nand_test: file producued by command: iverilog -o nand_test nand_gate.v nand_tb.v
### -Once this file is produced, I ran command: vvp nand_test 
###  to run the simulation, which produceds the .vcd file. 
## nand_tb.vcd: waveform data file produced by simulation 

## Here is the waveform image produced when I ran command: gtkwave nand_tb.vcd
![My Image](nand_wave.png)