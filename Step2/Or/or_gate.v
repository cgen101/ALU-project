`ifndef OR_GATE_V
`define OR_GATE_V

module or_gate (Y, A, B);
    output [3:0] Y;
    input [3:0] A, B;
    assign Y = A | B; 
endmodule

`endif