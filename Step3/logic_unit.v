`ifndef LOGIC_UNIT_V
`define LOGIC_UNIT_V

module nand_1bit (Y, A, B);
    output Y; 
    input A, B; 
    assign Y = !(A && B);
endmodule

module nor_1bit (Y, A, B);
    output Y; 
    input A, B;
    assign Y = !(A | B);
endmodule

module not_1bit (Y, A);
    output Y;
    input A;
    assign Y = !A; 
endmodule


module and_4bit (Y, A, B);
    output [3:0] Y; // wire type by default
    input [3:0] A, B;
    assign Y = A & B; 
endmodule

module nand_4bit (Y, A, B);
    output [3:0] Y; // wire type by default
    input [3:0] A, B; 

    assign Y = ~(A & B);  
endmodule

module nor_4bit (Y, A, B);
    output [3:0] Y; // wire type by default
    input [3:0] A, B;
    assign Y = ~(A | B); 
endmodule

module not_4bit (Y, A);
    output [3:0] Y;  // 4-bit output
    input  [3:0] A;  // 4-bit input
    assign Y = ~A; 
endmodule

module or_4bit (Y, A, B);
    output [3:0] Y; // wire type by default
    input [3:0] A, B;
    assign Y = A | B; 
endmodule

module xnor_4bit (Y, A, B);
    output [3:0] Y;  // 4-bit output
    input  [3:0] A;  // 4-bit input
    input  [3:0] B;  // 4-bit input
    assign Y = ~(A ^ B); 
endmodule

module xor_4bit (Y, A, B);
    output [3:0] Y; // wire type by default
    input [3:0] A, B; 
    assign Y = A ^ B; 
endmodule

module logic_1bit (
    output reg Y,          // reg because assigned inside always block
    input A, B,           // Inputs
    input [2:0] control   // 3-bit control signal to select operation
);
    always @(*) begin
        case (control)
            3'b000: Y = A & B;        // AND
            3'b001: Y = !(A & B);     // NAND
            3'b010: Y = A | B;        // OR
            3'b011: Y = !(A | B);     // NOR
            3'b100: Y = A ^ B;        // XOR
            3'b101: Y = ~(A ^ B);     // XNOR
            3'b110: Y = !A;           // NOT
            default: Y = 0;           // Default to 0 if invalid control signal
        endcase
    end
endmodule

module logic_4bit (
    output reg [3:0] Y,      // reg for procedural assignments
    input [3:0] A, B,        // 4-bit inputs
    input [2:0] control      // 3-bit control signal to select operation
);
    always @(*) begin
        case (control)
            3'b000: Y = A & B;        // AND
            3'b001: Y = ~(A & B);     // NAND
            3'b010: Y = A | B;        // OR
            3'b011: Y = ~(A | B);     // NOR
            3'b100: Y = A ^ B;        // XOR
            3'b101: Y = ~(A ^ B);     // XNOR
            3'b110: Y = ~A;           // NOT (applies to both A)
            default: Y = 4'b0000;     // Default to 0000 if invalid control signal
        endcase
    end
endmodule

`endif