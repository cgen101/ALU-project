`timescale 1ns / 1ns
`include "not_gate_32bit.v"

module not_tb_32bit;

reg [31:0]A;
wire [31:0]Y;

not_gate_32bit uut(Y, A);

integer i;  // Loop variable
initial begin

    $dumpfile("not_tb_32bit.vcd");//holds output waveform
    $dumpvars(0, not_tb_32bit);

        A = 32'h00000000; #10;
        A = 32'hFFFFFFFF; #10;
        A = 32'hA5A5A5A5; #10;
        A = 32'h5A5A5A5A; #10;
    
    $display("Testing not");

end

endmodule