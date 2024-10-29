`ifndef NOR_GATE_V
`define NOR_GATE_V

module nor_gate (Y, A, B);
    output [3:0] Y;
    input [3:0] A, B;
    assign Y = !(A | B); 
endmodule

`endif