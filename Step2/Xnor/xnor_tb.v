`timescale 1ns / 1ns
`include "xnor_gate.v"

module xnor_tb;

reg [3:0]A;
reg [3:0]B;
wire [3:0]Y;

xnor_gate uut(
    .Y(Y),
    .A(A),
    .B(B));

integer i;  // Loop variable
initial begin

    $dumpfile("xnor_tb.vcd");//holds output waveform
    $dumpvars(0, xnor_tb);
        // Apply test cases
        A = 4'b0000; B = 4'b0000; #10; 
        A = 4'b0000; B = 4'b1111; #10; 
        A = 4'b1010; B = 4'b0101; #10; 
        A = 4'b1100; B = 4'b1010; #10; 
        A = 4'b1111; B = 4'b1111; #10; 
        A = 4'b0110; B = 4'b0110; #10; 
        A = 4'b1001; B = 4'b1001; #10; 
        A = 4'b1101; B = 4'b0111; #10;

    
    $display("Testing xnor");

end

endmodule