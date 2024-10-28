`timescale 1ns / 1ns
`include "addition.v"  // Include the addition module

module addition_tb;

    reg [3:0] A, B;      // 4-bit inputs
    reg carry_in;        // 1-bit carry in
    wire [3:0] Sum;      // 4-bit sum output
    wire carry_out;      // 1-bit carry out

    // Instantiate the addition module
    addition uut (
        .A(A),
        .B(B),
        .carry_in(carry_in),
        .Sum(Sum),
        .carry_out(carry_out)
    );

    // Test cases
    initial begin
        // Initialize dump file for waveform
        $dumpfile("addition_tb.vcd"); 
        $dumpvars(0, addition_tb);

        // Test 1: A = 4'b0001, B = 4'b0010, carry_in = 0
        A = 4'b0001;
        B = 4'b0010;
        carry_in = 1'b0;
        #10;
        $display("Test 1: A = %b, B = %b, carry_in = %b => Sum = %b, carry_out = %b", A, B, carry_in, Sum, carry_out);

        // Test 2: A = 4'b1111, B = 4'b0001, carry_in = 0 (expect carry_out = 1)
        A = 4'b1111;
        B = 4'b0001;
        carry_in = 1'b0;
        #10;
        $display("Test 2: A = %b, B = %b, carry_in = %b => Sum = %b, carry_out = %b", A, B, carry_in, Sum, carry_out);

        // Test 3: A = 4'b1010, B = 4'b0101, carry_in = 0
        A = 4'b1010;
        B = 4'b0101;
        carry_in = 1'b0;
        #10;
        $display("Test 3: A = %b, B = %b, carry_in = %b => Sum = %b, carry_out = %b", A, B, carry_in, Sum, carry_out);

        // Test 4: A = 4'b1000, B = 4'b1000, carry_in = 1 (expect carry_out = 1)
        A = 4'b1000;
        B = 4'b1000;
        carry_in = 1'b1;
        #10;
        $display("Test 4: A = %b, B = %b, carry_in = %b => Sum = %b, carry_out = %b", A, B, carry_in, Sum, carry_out);

        // Test 5: A = 4'b0000, B = 4'b0000, carry_in = 1 (expect carry_out = 0)
        A = 4'b0000;
        B = 4'b0000;
        carry_in = 1'b1;
        #10;
        $display("Test 5: A = %b, B = %b, carry_in = %b => Sum = %b, carry_out = %b", A, B, carry_in, Sum, carry_out);

        // Finish simulation
        $finish;
    end

endmodule