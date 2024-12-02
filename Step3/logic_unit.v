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
    output [3:0] Y;
    input [3:0] A, B;
    assign Y = A & B; 
endmodule

module nand_4bit (Y, A, B);
    output [3:0] Y;
    input [3:0] A, B; 

    assign Y = ~(A & B);  
endmodule

module nor_4bit (Y, A, B);
    output [3:0] Y;
    input [3:0] A, B;
    assign Y = ~(A | B); 
endmodule

module not_4bit (Y, A);
    output [3:0] Y;  // 4-bit output
    input  [3:0] A;  // 4-bit input
    assign Y = ~A; 
endmodule

module or_4bit (Y, A, B);
    output [3:0] Y;
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
    output [3:0] Y; 
    input [3:0] A, B; 
    assign Y = A ^ B; 
endmodule