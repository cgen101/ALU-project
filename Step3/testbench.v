`timescale 1ns / 1ps
`include "alu.v"
`include "logic_unit.v"
`include "shifter.v"

module testbench;

    // Inputs for logical operations
    reg A, B;
    reg [3:0] A4, B4;
    reg [1:0] amt;         // For shift amount
    reg dir;               // For shift direction (0 = left, 1 = right)
    reg [1:0] control;     // For controlling shift type (left/right)
    reg carry_in;          // For arithmetic operations
    reg [3:0] dividend, divisor;

    // Outputs for logical operations
    wire Y;           // 1-bit wire
    wire [3:0] Y4;    // 4-bit wire

    // Outputs for arithmetic operations
    wire [3:0] Sum, SubResult, MulLow, MulHigh, DivQuotient, DivRemainder;
    wire carry_out, valid;

    // Instantiate logical operations modules
    nand_1bit uut_nand1 (.Y(Y), .A(A), .B(B));
    nor_1bit uut_nor1 (.Y(Y), .A(A), .B(B));
    not_1bit uut_not1 (.Y(Y), .A(A));

    and_4bit uut_and4 (.Y(Y4), .A(A4), .B(B4));
    nand_4bit uut_nand4 (.Y(Y4), .A(A4), .B(B4));
    nor_4bit uut_nor4 (.Y(Y4), .A(A4), .B(B4));
    not_4bit uut_not4 (.Y(Y4), .A(A4));
    or_4bit uut_or4 (.Y(Y4), .A(A4), .B(B4));
    xor_4bit uut_xor4 (.Y(Y4), .A(A4), .B(B4));
    xnor_4bit uut_xnor4 (.Y(Y4), .A(A4), .B(B4));

    // Instantiate shift modules
    shift_1bit uut_shift1 (.Y(Y4), .A(A4));
    shift_2x4bit uut_shift4 (.Y(Y4), .A(A4), .amt(amt), .dir(dir));

    // Instantiate arithmetic operations modules
    addition uut_addition (.A(A4), .B(B4), .carry_in(carry_in), .Sum(Sum), .carry_out(carry_out));
    subtraction uut_subtraction (.Y(SubResult), .A(A4), .B(B4));
    multiplication uut_multiplication (.A(A4), .B(B4), .product_low(MulLow), .product_high(MulHigh));
    division uut_division (.dividend(dividend), .divisor(divisor), .quotient(DivQuotient), .remainder(DivRemainder), .valid(valid));

    // Create waveform dump
    initial begin
        $dumpfile("waveform.vcd");   // Name of the VCD file for the waveform
        $dumpvars(0, testbench);     // Dump all variables in the testbench module

        // Test Logical Operations
        A = 1; B = 0;
        #10; $display("nand_1bit: %b AND %b = %b", A, B, Y);
        #10; $display("nor_1bit: %b OR %b = %b", A, B, Y);
        #10; $display("not_1bit: NOT %b = %b", A, Y);

        A4 = 4'b1100; B4 = 4'b1010;
        #10; $display("and_4bit: %b AND %b = %b", A4, B4, Y4);
        #10; $display("nand_4bit: %b NAND %b = %b", A4, B4, Y4);
        #10; $display("nor_4bit: %b NOR %b = %b", A4, B4, Y4);
        #10; $display("not_4bit: NOT %b = %b", A4, Y4);
        #10; $display("or_4bit: %b OR %b = %b", A4, B4, Y4);
        #10; $display("xor_4bit: %b XOR %b = %b", A4, B4, Y4);
        #10; $display("xnor_4bit: %b XNOR %b = %b", A4, B4, Y4);

        // Test Shift Operations
        amt = 2'b01; dir = 1'b0; A4 = 4'b1010;   // Shift left by 1
        #10; $display("shift_1bit (left): %b -> %b", A4, Y4);

        amt = 2'b01; dir = 1'b1; A4 = 4'b1010;   // Shift right by 1
        #10; $display("shift_1bit (right): %b -> %b", A4, Y4);

        amt = 2'b10; dir = 1'b0; A4 = 4'b1010;   // Shift left by 2
        #10; $display("shift_2x4bit (left): %b -> %b", A4, Y4);

        amt = 2'b10; dir = 1'b1; A4 = 4'b1010;   // Shift right by 2
        #10; $display("shift_2x4bit (right): %b -> %b", A4, Y4);

        // Test Arithmetic Operations
        A4 = 4'b1101; B4 = 4'b1010; carry_in = 1'b0;
        #10; $display("addition: %b + %b = %b, carry_out = %b", A4, B4, Sum, carry_out);

        #10; $display("subtraction: %b - %b = %b", A4, B4, SubResult);

        #10; $display("multiplication: %b * %b = %b %b", A4, B4, MulHigh, MulLow);

        dividend = 4'b1010; divisor = 4'b0011; // 10 / 3
        #10; $display("division: %b / %b = quotient: %b, remainder: %b", dividend, divisor, DivQuotient, DivRemainder);

        $finish;
    end

endmodule