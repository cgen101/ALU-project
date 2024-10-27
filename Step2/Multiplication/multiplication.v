`ifndef MULTIPLICATION_V
`define MULTIPLICATION_V

module multiplier_4bit (
    input [3:0] A, B,   
    output [3:0] product_low,   // Lower 4 bits of the product
    output [3:0] product_high   // Upper 4 bits of the product
);
    wire [7:0] full_product;    // 8-bit wire to hold the full product
    
    assign full_product = A * B;
    assign product_low = full_product[3:0];   // Lower 4 bits
    assign product_high = full_product[7:4];  // Upper 4 bits
endmodule

`endif