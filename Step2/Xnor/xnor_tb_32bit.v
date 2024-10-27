`timescale 1ns / 1ns
`include "xnor_gate_32bit.v"

module xnor_tb_32bit;

reg [31:0]A;
reg [31:0]B;
wire [31:0]Y;

xnor_gate_32bit uut(
    .Y(Y),
    .A(A),
    .B(B));

integer i;  // Loop variable
initial begin

    $dumpfile("xnor_tb_32bit.vcd");//holds output waveform
    $dumpvars(0, xnor_tb_32bit);
        A = 32'h00000000; B = 32'h00000000; #10;
        A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; #10;
        A = 32'hAAAAAAAA; B = 32'h55555555; #10;
        A = 32'hF0F0F0F0; B = 32'hF0F0F0F0; #10;
        A = 32'h0F0F0F0F; B = 32'hF0F0F0F0; #10;
        A = 32'h33333333; B = 32'h33333333; #10;
        A = 32'h3C3C3C3C; B = 32'hC3C3C3C3; #10;
        A = 32'h12345678; B = 32'h87654321; #10;

    
    $display("Testing xnor");

end

endmodule