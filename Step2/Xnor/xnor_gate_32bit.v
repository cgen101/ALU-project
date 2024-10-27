`ifndef xnor_GATE_32bit_V
`define xnor_GATE_32bit_V

module xnor_gate_32bit (Y, A, B);
    output [31:0] Y;  // 4-bit output
    input  [31:0] A;  // 4-bit input
    input  [31:0] B;  // 4-bit input
    assign Y = ~(A ^ B); 
endmodule

`endif