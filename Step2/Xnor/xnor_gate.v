`ifndef xnor_GATE_V
`define xnor_GATE_V

module xnor_gate (Y, A, B);
    output [3:0] Y;  // 4-bit output
    input  [3:0] A;  // 4-bit input
    input  [3:0] B;  // 4-bit input
    assign Y = ~(A ^ B); 
endmodule

`endif