`timescale 1ns / 1ns
`include "not_gate.v"

module not_tb;

reg [3:0]A;
wire [3:0]Y;

not_gate uut(Y, A);

initial begin

    $dumpfile("not_tb.vcd");//holds output waveform
    $dumpvars(0, not_tb);

        A = 4'b0000; #10;
        A = 4'b1111; #10;
        A = 4'b1010; #10;
        A = 4'b0101; #10;
    
    $display("Testing not");

end

endmodule