`ifndef AND_GATE_V
`define AND_GATE_V

module and_gate (Y, A, B);
    output [3:0] Y;     // 4-bit output
    input [3:0] A, B;   // 4-bit inputs
    assign Y = A & B;   // Bitwise AND operation
endmodule

`endif