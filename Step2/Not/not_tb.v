`timescale 1ns / 1ns
`include "not_gate.v"

module not_tb;

reg [3:0]A;
wire [3:0]Y;

not_gate uut(Y, A);

integer i;  // Loop variable
initial begin

    $dumpfile("not_tb.vcd");//holds output waveform
    $dumpvars(0, not_tb);

    // Loop through all 16 combinations of 4-bit input
    for (i = 0; i < 16; i = i + 1) begin
        A = i;  // Assign binary value of i to A
        #10;    // Wait for 10 time units
    end

    
    $display("Testing not");

end

endmodule