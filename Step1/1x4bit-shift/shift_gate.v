`ifndef SHIFT_GATE_V
`define SHIFT_GATE_V

module shift_gate (Y, A);
    output [3:0] Y;
    input [3:0] A;
    assign Y = A << 1;
endmodule

`endif