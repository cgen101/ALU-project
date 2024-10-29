`ifndef xnor_GATE_8bit_V
`define xnor_GATE_8bit_V

module xnor_gate_8bit (Y, A, B);
    output [7:0] Y;  // 4-bit output
    input  [7:0] A;  // 4-bit input
    input  [7:0] B;  // 4-bit input
    assign Y = ~(A ^ B); 
endmodule

`endif