`ifndef NOT_GATE_V
`define NOT_GATE_V

module not_gate (Y, A);
    output [3:0] Y;  // 4-bit output
    input  [3:0] A;  // 4-bit input
    assign Y = ~A; 
endmodule

`endif