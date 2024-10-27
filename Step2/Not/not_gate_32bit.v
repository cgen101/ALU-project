`ifndef NOT_GATE_32bit_V
`define NOT_GATE_32bit_V

module not_gate_32bit (Y, A);
    output [31:0] Y;  // 32-bit output
    input  [31:0] A;  // 32-bit input
    assign Y = ~A; 
endmodule

`endif