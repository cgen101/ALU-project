`ifndef NAND_GATE_V
`define NAND_GATE_V

module nand_gate (Y, A, B);
    output [3:0] Y;  // 4-bit output
    input [3:0] A, B;  // 4-bit inputs

    assign Y = !(A & B);  
endmodule

`endif