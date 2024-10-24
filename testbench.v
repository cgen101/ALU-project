`timescale 1ns / 1ns
`include "circuit-design.v" 

module testbench;
    // Inputs
    reg A, B;
    reg [3:0] C;

    // Outputs
    wire not_out, nand_out, nor_out;
    wire [3:0] shift_out;

    // Instantiate the modules
    not_gate ng(.Y(not_out), .A(A));
    nand_gate uut(.Y(nand_out), .A(A), .B(B)); 
    nor_gate norg(.Y(nor_out), .A(A), .B(B));
    shift_4bit s4b(.Y(shift_out), .A(C));

    initial begin
        // Setup waveform dumping
        $dumpfile("testbench.vcd"); // Output waveform file
        $dumpvars(0, testbench); // Dump all variables in the testbench

        // Testing not_gate
        A = 0; #10;
        A = 1; #10;

        // Testing nand_gate (uut)
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        // Testing nor_gate
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        // Testing shift_4bit
        C = 4'b0000; #10; // Shift by 1 results in 0000
        C = 4'b0001; #10; // Shift by 1 results in 0001
        C = 4'b0010; #10; // Shift by 1 results in 0010
        C = 4'b1111; #10; // Shift by 1 results in 1111

        // End of simulation
        $finish;
    end
endmodule
