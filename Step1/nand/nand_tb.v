`timescale 1ns / 1ns
`include "nand_gate.v"

module nand_tb;

reg A, B;
wire Y;

nand_gate uut(Y, A, B);

initial begin

    $dumpfile("nand_tb.vcd");//holds output waveform
    $dumpvars(0, nand_tb);

    A = 0;
    B = 0;
    #10;

    A = 0;
    B = 1;
    #10;

    A = 1;
    B = 0;
    #10;

    A = 1;
    B = 1;
    #10;    
    
    $display("Testing nand");

end

endmodule
