`timescale 1ns / 1ps

module division_tb;

    reg [3:0] dividend;
    reg [3:0] divisor;

    wire [3:0] quotient;
    wire [3:0] remainder;
    wire valid;

    division uut (
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder),
        .valid(valid)
    );

    initial begin
        $dumpfile("division_tb.vcd");
        $dumpvars(0, division_tb);

        $monitor("Time: %0t | Dividend: %b | Divisor: %b | Quotient: %b | Remainder: %b | Valid: %b", 
                 $time, dividend, divisor, quotient, remainder, valid);

        // Test 1: 0 / 1
        dividend = 4'b0000; // 0
        divisor = 4'b0001;  // 1
        #10; // Expected: Q = 0, R = 0, Valid = 1

        // Test 2: 1 / 1
        dividend = 4'b0001; // 1
        divisor = 4'b0001;  // 1
        #10; // Expected: Q = 1, R = 0, Valid = 1

        // Test 3: 4 / 2
        dividend = 4'b0100; // 4
        divisor = 4'b0010;  // 2
        #10; // Expected: Q = 2, R = 0, Valid = 1

        // Test 4: 7 / 4
        dividend = 4'b0111; // 7
        divisor = 4'b0100;  // 4
        #10; // Expected: Q = 1, R = 3, Valid = 1

        // Test 5: 10 / 3
        dividend = 4'b1010; // 10
        divisor = 4'b0011;  // 3
        #10; // Expected: Q = 3, R = 1, Valid = 1

        // Test 6: Division by zero
        dividend = 4'b1001; // 9
        divisor = 4'b0000;  // 0
        #10; // Expected: Q = 0, R = 9, Valid = 0

        $finish;
    end

endmodule