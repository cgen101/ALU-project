`timescale 1ns / 1ns
`include "or_gate.v"

module or_tb;

    reg [3:0] A, B;
    wire [3:0] Y; 

    or_gate uut(Y, A, B); 

    integer i, j;

    initial begin
        $dumpfile("or_tb.vcd");
        $dumpvars(0, or_tb);

        // Loop through all 16 possible values of A and B
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i; 
                B = j; 
                #10; 
                $display("A = %b, B = %b, Y = %b", A, B, Y);  // Display A, B, and Y
            end
        end

        $display("All combinations tested");
        $finish;
    end

endmodule