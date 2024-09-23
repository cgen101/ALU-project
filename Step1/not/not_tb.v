`timescale 1ns / 1ns
`include "not_gate.v"

module not_tb;

reg A;
wire Y;

not_gate uut(Y, A);

initial begin

    $dumpfile("not_tb.vcd");//holds output waveform
    $dumpvars(0, not_tb);

    A = 0;
    #10;

    A = 1;
    #10;
    
    $display("Testing not");

end

endmodule