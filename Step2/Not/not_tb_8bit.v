`timescale 1ns / 1ns
`include "not_gate_8bit.v"

module not_tb_8bit;

reg [7:0]A;
wire [7:0]Y;

not_gate_8bit uut(Y, A);

integer i;  // Loop variable
initial begin

    $dumpfile("not_tb_8bit.vcd");//holds output waveform
    $dumpvars(0, not_tb_8bit);

        A = 8'h00; #10;
        A = 8'hFF; #10;
        A = 8'hA5; #10;
        A = 8'h5A; #10;

    
    $display("Testing not");

end

endmodule