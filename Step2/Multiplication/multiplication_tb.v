`timescale 1ns / 1ns
`include "multiplication.v"

module multiplier_tb;

    reg [3:0] A, B;
    wire [3:0] product_low;
    wire [3:0] product_high;

    multiplier_4bit uut (
        .A(A), 
        .B(B), 
        .product_low(product_low), 
        .product_high(product_high)
    );

    initial begin
        $dumpfile("multiplier_tb.vcd");
        $dumpvars(0, multiplier_tb);

        A = 4'b0010; B = 4'b0011; #10;  
        $display("A = %b, B = %b, product_low = %b, product_high = %b", A, B, product_low, product_high);

        A = 4'b0101; B = 4'b0101; #10;  
        $display("A = %b, B = %b, product_low = %b, product_high = %b", A, B, product_low, product_high);

        A = 4'b0110; B = 4'b0011; #10;  
        $display("A = %b, B = %b, product_low = %b, product_high = %b", A, B, product_low, product_high);

        A = 4'b1001; B = 4'b0100; #10;  
        $display("A = %b, B = %b, product_low = %b, product_high = %b", A, B, product_low, product_high);

        A = 4'b1111; B = 4'b1111; #10;  
        $display("A = %b, B = %b, product_low = %b, product_high = %b", A, B, product_low, product_high);

        $display("Selected test cases completed");
        $finish;
    end

endmodule