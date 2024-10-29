`timescale 1ns / 1ns
`include "xnor_gate_16bit.v"

module xnor_tb_16bit;

reg [15:0]A;
reg [15:0]B;
wire [15:0]Y;

xnor_gate_16bit uut(
    .Y(Y),
    .A(A),
    .B(B));

integer i;  // Loop variable
initial begin

    $dumpfile("xnor_tb_16bit.vcd");//holds output waveform
    $dumpvars(0, xnor_tb_16bit);
        // 16-bit Test Cases
        A = 16'h0000; B = 16'h0000; #10;
        A = 16'hFFFF; B = 16'hFFFF; #10;
        A = 16'hAAAA; B = 16'h5555; #10;
        A = 16'hF0F0; B = 16'hF0F0; #10;
        A = 16'h0F0F; B = 16'hF0F0; #10;
        A = 16'h3333; B = 16'h3333; #10;
        A = 16'h3C3C; B = 16'hC3C3; #10;
        A = 16'h1234; B = 16'h4321; #10;

    
    $display("Testing xnor 16 bit");

end

endmodule