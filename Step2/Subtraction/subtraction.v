`ifndef SUBTRACTION_V
`define SUBTRACTION_V

module subtraction (Y, A, B);
    output [3:0] Y;  // 4-bit output
    input  [3:0] A;  // 4-bit input A
    input  [3:0] B;  // 4-bit input B

    assign Y = A - B;  // Perform 4-bit subtraction

endmodule

`endif