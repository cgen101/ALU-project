`ifndef NAND_GATE_V
`define NAND_GATE_V

module nand_gate (Y, A, B);
    output [3:0] Y;
    input [3:0] A, B; 

    assign Y = !(A & B);  
endmodule

`endif