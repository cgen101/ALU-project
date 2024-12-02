module addition (
    input [3:0] A,         // 4-bit input A
    input [3:0] B,         // 4-bit input B
    input carry_in,        // 1-bit carry in
    output [3:0] Sum,      // 4-bit sum output
    output carry_out       // 1-bit carry out
);

    wire [4:0] full_sum;   // 5-bit sum to accommodate carry-out

    // Perform the addition with carry_in
    assign full_sum = A + B + carry_in;
    
    // Assign the lower 4 bits of the sum to the Sum output
    assign Sum = full_sum[3:0];
    
    // The 5th bit is the carry_out
    assign carry_out = full_sum[4];

endmodule

module subtraction (Y, A, B);
    output [3:0] Y;  // 4-bit output
    input  [3:0] A;  // 4-bit input A
    input  [3:0] B;  // 4-bit input B

    assign Y = A - B;  // Perform 4-bit subtraction

endmodule

module multiplication (
    input [3:0] A, B,   
    output [3:0] product_low,   // Lower 4 bits of the product
    output [3:0] product_high   // Upper 4 bits of the product
);
    wire [7:0] full_product;    // 8-bit wire to hold the full product
    
    assign full_product = A * B;
    assign product_low = full_product[3:0];   // Lower 4 bits
    assign product_high = full_product[7:4];  // Upper 4 bits
endmodule

module division (
    input [3:0] dividend,
    input [3:0] divisor,
    output reg [3:0] quotient,
    output reg [3:0] remainder,
    output reg valid
);
    reg [3:0] temp_dividend;
    reg [3:0] temp_quotient;
    
    integer i;

    always @(*) begin
        quotient = 4'b0000;
        remainder = 4'b0000;
        valid = 1'b0;

        if (divisor == 0) begin
            valid = 1'b0; 
            quotient = 4'b0000;
            remainder = dividend; 
        end else begin
            temp_dividend = dividend;
            temp_quotient = 4'b0000;

            for (i = 3; i >= 0; i = i - 1) begin
                temp_quotient = {temp_quotient[2:0], temp_dividend[3]};
                temp_dividend = {temp_dividend[2:0], 1'b0};

                //if (temp_quotient >= divisor) begin
                //    temp_quotient = temp_quotient - divisor;
                //    dividend[i:i] = 1'b1;
                //    end
            end

            quotient = temp_quotient;
            remainder = dividend;
            valid = 1'b1;
        end
    end
endmodule




