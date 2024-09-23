`ifndef NOR_GATE_V
`define NOR_GATE_V

module nor_gate (Y, A, B);
    output Y; 
    input A, B;
    assign Y = !(A | B);
endmodule

`endif