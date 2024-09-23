`timescale 1ns / 1ns
`include "nor_gate.v"

module nor_tb;

reg A, B;
wire Y;

nor_gate uut(Y, A, B);

initial begin

    $dumpfile("nor_tb.vcd");//holds output waveform
    $dumpvars(0, nor_tb);

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
    
    $display("Testing nor");

end

endmodule