`ifndef NAND_GATE_V
`define NAND_GATE_V

module nand_gate (Y, A, B);
    output Y; 
    input A, B; 
    assign Y = !(A && B);
endmodule

`endif