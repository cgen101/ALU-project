module not_gate (Y, A);
    output Y;
    input A;
    assign Y = !A; 
endmodule

module nand_gate (Y, A, B);
    output Y; 
    input A, B; 
    assign Y= !(A && B);
endmodule

module nor_gate (Y, A, B);
    output Y; 
    input A, B;
    assign Y = !(A | B);
endmodule

module shift_4bit (Y, A);
    output [3:0] Y;
    input [3:0] A;
    assign Y = A << 1;
endmodule

