`timescale 1ns / 1ns
`include "xnor_gate_8bit.v"

module xnor_tb_8bit;

reg [7:0]A;
reg [7:0]B;
wire [7:0]Y;

xnor_gate_8bit uut(
    .Y(Y),
    .A(A),
    .B(B));

integer i;  // Loop variable
initial begin

    $dumpfile("xnor_tb_8bit.vcd");//holds output waveform
    $dumpvars(0, xnor_tb_8bit);
        // Apply test cases
        A = 8'h00; B = 8'h00; #10;
        A = 8'hFF; B = 8'hFF; #10;
        A = 8'hAA; B = 8'h55; #10;
        A = 8'hF0; B = 8'hF0; #10;
        A = 8'h0F; B = 8'hF0; #10;
        A = 8'h33; B = 8'h33; #10;
        A = 8'h3C; B = 8'hC3; #10;
        A = 8'h12; B = 8'h21; #10;

    
    $display("Testing xnor");

end

endmodule