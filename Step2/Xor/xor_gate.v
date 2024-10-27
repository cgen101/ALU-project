`ifndef XOR_GATE_V
`define XOR_GATE_V

module xor_gate (Y, A, B);
    output [3:0] Y; 
    input [3:0] A, B; 
    assign Y = A ^ B; 
endmodule

`endif