`timescale 1ns / 1ps

module shift_tb;

    // Inputs
    reg [3:0] A;
    reg [1:0] amt;
    reg dir;

    // Outputs
    wire [3:0] Y;

    // Instantiate the shifter module
    shift_gate uut (
        .A(A),
        .amt(amt),
        .dir(dir),
        .Y(Y)
    );

    initial begin
        // Open a file for waveform output
        $dumpfile("shift_tb.vcd");
        $dumpvars(0, shift_tb);

        // Test 1: No shift
        A = 4'b1010;  // Input: 10
        amt = 2'b00;  // Shift amount: 0
        dir = 1'b0;   // Direction: left
        #10;

        // Test 2: Left shift by 1
        amt = 2'b01;  // Shift amount: 1
        dir = 1'b0;   // Direction: left
        #10;

        // Test 3: Left shift by 2
        amt = 2'b10;  // Shift amount: 2
        dir = 1'b0;   // Direction: left
        #10;

        // Test 4: Right shift by 1
        amt = 2'b01;  // Shift amount: 1
        dir = 1'b1;   // Direction: right
        #10;

        // Test 5: Right shift by 2
        amt = 2'b10;  // Shift amount: 2
        dir = 1'b1;   // Direction: right
        #10;

        // Test 6: Edge case - All zeros
        A = 4'b0000;  // Input: 0
        amt = 2'b10;  // Shift amount: 2
        dir = 1'b0;   // Direction: left
        #10;

        // End simulation
        $finish;
    end

endmodule