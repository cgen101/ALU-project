`timescale 1ns / 1ns
`include "shift_gate.v"

module shift_tb;

reg [3:0] A;
wire [3:0] Y; 

shift_gate uut(Y, A);

initial begin

    $dumpfile("shift_tb.vcd");//holds output waveform
    $dumpvars(0, shift_tb);

    A = 4'b0000; #10;
    A = 4'b0001; #10; 
    A = 4'b0010; #10; 
    A = 4'b1111; #10;

    $display("Testing shift");

end

endmodule