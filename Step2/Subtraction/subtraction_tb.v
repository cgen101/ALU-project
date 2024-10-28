`timescale 1ns / 1ns
`include "subtraction.v"

module subtraction_tb;

    reg [3:0] A;     // 4-bit input A
    reg [3:0] B;     // 4-bit input B
    wire [3:0] Y;    // 4-bit output Y (result of A - B)

    subtraction uut (Y, A, B);

    initial begin
        $dumpfile("subtraction_tb.vcd");  // Holds output waveform
        $dumpvars(0, subtraction_tb);

        // Test cases for 4-bit subtraction
        A = 4'b0001; B = 4'b0001; #10;  // Expected Y: 0000
        A = 4'b1010; B = 4'b0011; #10;  // Expected Y: 0111
        A = 4'b1100; B = 4'b0101; #10;  // Expected Y: 1001
        A = 4'b1111; B = 4'b1110; #10;  // Expected Y: 0001
        A = 4'b0101; B = 4'b1001; #10;  // Expected Y: Overflow

        $display("Testing subtraction");
    end

endmodule