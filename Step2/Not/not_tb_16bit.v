`timescale 1ns / 1ns
`include "not_gate_16bit.v"

module not_tb_16bit;

reg [15:0]A;
wire [15:0]Y;

not_gate_16bit uut(Y, A);

integer i;  // Loop variable
initial begin

    $dumpfile("not_tb_16bit.vcd");//holds output waveform
    $dumpvars(0, not_tb_16bit);

        A = 16'h0000; #10;
        A = 16'hFFFF; #10;
        A = 16'hAAAA; #10;
        A = 16'h5555; #10;

    
    $display("Testing not");

end

endmodule