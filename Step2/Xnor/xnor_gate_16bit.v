`ifndef xnor_gate_16bit_V
`define xnor_gate_16bit_V

module xnor_gate_16bit (Y, A, B);
    output [15:0] Y;  // 4-bit output
    input  [15:0] A;  // 4-bit input
    input  [15:0] B;  // 4-bit input
    assign Y = ~(A ^ B); 
endmodule

`endif