`ifndef NOT_GATE_16bit_V
`define NOT_GATE_16bit_V

module not_gate_16bit (Y, A);
    output [15:0] Y;  // 16-bit output
    input  [15:0] A;  // 16-bit input
    assign Y = ~A; 
endmodule

`endif