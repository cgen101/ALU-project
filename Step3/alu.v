`ifndef ALU_V
`define ALU_V

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

`ifndef ALU_V
`define ALU_V

module alu (
    input [3:0] A, B,       // 4-bit inputs
    input carry_in,         // Carry input for addition
    input [1:0] shift_amt,  // 2-bit shift amount (unused in this case)
    input shift_dir,        // Shift direction (unused in this case)
    input [3:0] opcode,     // 4-bit control signal
    output reg [3:0] Y,     // 4-bit result output (this is a reg)
    output reg carry_out,   // Carry-out for addition (this is a reg)
    output reg valid_div,   // Valid flag for division (this is a reg)
    output reg [3:0] remainder, // Remainder from division (this is a reg)
    output reg [3:0] product_low, // Multiplication low part (this is a reg)
    output reg [3:0] product_high // Multiplication high part (this is a reg)
);

    // Intermediate wires for all module outputs
    wire [3:0] arithmetic_out;
    wire [3:0] quotient_out, remainder_out;
    wire add_carry_out;

    // Instantiate Arithmetic Modules
    addition u_add (.A(A), .B(B), .carry_in(carry_in), .Sum(arithmetic_out), .carry_out(add_carry_out));
    subtraction u_sub (.Y(arithmetic_out), .A(A), .B(B)); // Subtraction
    multiplication u_mul (.A(A), .B(B), .product_low(product_low), .product_high(product_high));  // Multiplication
    division u_div (.dividend(A), .divisor(B), .quotient(quotient_out), .remainder(remainder_out), .valid(valid_div)); // Division

    always @(*) begin
        // Default values (optional)
        product_low = 4'b0000;
        product_high = 4'b0000;
        valid_div = 1'b0;

        case (opcode[3:2])
            2'b00: begin    // Arithmetic operations (addition/subtraction)
                case (opcode[1:0])
                    2'b00: begin
                        Y = arithmetic_out;  // Addition
                        carry_out = add_carry_out;
                    end
                    2'b01: Y = arithmetic_out;  // Subtraction
                    default: Y = 4'b0000; // Default
                endcase
            end

            2'b01: begin  // Multiplication
                Y = product_low;  // Lower 4 bits of the product
                product_high = product_high;  // Returning upper 4 bits if needed
            end

            2'b10: begin  // Division
                Y = quotient_out;
                remainder = remainder_out;
                valid_div = 1'b1;
            end

            default: Y = 4'b0000; // Default case for unsupported operations
        endcase
    end
endmodule

`endif
`endif

