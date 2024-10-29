`ifndef NOT_GATE_8bit_V
`define NOT_GATE_8bit_V

module not_gate_8bit (Y, A);
    output [7:0] Y;  // 16-bit output
    input  [7:0] A;  // 16-bit input
    assign Y = ~A; 
endmodule

`endif