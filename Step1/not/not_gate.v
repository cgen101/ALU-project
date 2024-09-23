`ifndef NOT_GATE_V
`define NOT_GATE_V

module not_gate (Y, A);
    output Y;
    input A;
    assign Y = !A; 
endmodule

`endif