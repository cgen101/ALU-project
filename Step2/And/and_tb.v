`timescale 1ns / 1ns
`include "and_gate.v"

module and_tb;

    reg [3:0] A, B;  // 4-bit inputs
    wire [3:0] Y;    // 4-bit output

    and_gate uut(Y, A, B);  // Instantiate the 4-bit AND gate

    integer i, j;

    initial begin
        $dumpfile("and_tb.vcd");  // holds output waveform
        $dumpvars(0, and_tb);

        // Loop through all 16 possible values of A and B
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i;  // Assign A to the current value
                B = j;  // Assign B to the current value
                #10;    // Wait for 10 time units
                $display("A = %b, B = %b, Y = %b", A, B, Y);  // Display A, B, and Y
            end
        end

        $display("All combinations tested");
        $finish;
    end

endmodule