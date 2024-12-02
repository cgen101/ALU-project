module alu (
    input [3:0] A, B,       // 4-bit inputs
    input carry_in,         // Carry input for addition
    input [1:0] shift_amt,  // 2-bit shift amount
    input shift_dir,        // Shift direction (0=left, 1=right)
    input [3:0] opcode,     // 4-bit control signal
    output reg [3:0] Y,     // 4-bit result output
    output reg carry_out,   // Carry-out for addition
    output reg valid_div,   // Valid flag for division
    output reg [3:0] remainder, // Remainder from division
    output reg [3:0] product_low, // Multiplication low part
    output reg [3:0] product_high // Multiplication high part
);

    // Intermediate wires for all module outputs
    wire [3:0] logic_out, arithmetic_out, shift_out;
    wire [3:0] quotient_out, remainder_out;
    wire add_carry_out;

    // Instantiate Logic Modules
    and_4bit u_and (.Y(logic_out), .A(A), .B(B));
    or_4bit u_or (.Y(logic_out), .A(A), .B(B));  // Example for OR logic
    // Add other logic modules as needed

    // Instantiate Arithmetic Modules
    addition u_add (.A(A), .B(B), .carry_in(carry_in), .Sum(arithmetic_out), .carry_out(add_carry_out));
    subtraction u_sub (.Y(arithmetic_out), .A(A), .B(B)); // Example for subtraction
    multiplication u_mul (.A(A), .B(B), .product_low(product_low), .product_high(product_high));  // Multiplication
    division u_div (.dividend(A), .divisor(B), .quotient(quotient_out), .remainder(remainder_out), .valid(valid_div)); // Division

    // Instantiate Shift Modules
    shift_2x4bit u_shift (.A(A), .amt(shift_amt), .dir(shift_dir), .Y(shift_out));

    // Control Circuit Logic (using opcode to select the operation)
    always @(*) begin
        carry_out = 1'b0;
        valid_div = 1'b0;
        remainder = 4'b0000;
        product_low = 4'b0000;
        product_high = 4'b0000;

        case (opcode[3:2])  // Select operation type (Logic, Arithmetic, Shift, Division)
            2'b00: begin    // Logic operations
                case (opcode[1:0]) 
                    2'b00: Y = logic_out; // AND operation
                    2'b01: Y = logic_out; // OR operation
                    // Add more logic operations as needed
                    default: Y = 4'b0000; // Default
                endcase
            end

            2'b01: begin    // Arithmetic operations
                case (opcode[1:0])
                    2'b00: begin
                        Y = arithmetic_out;  // Addition
                        carry_out = add_carry_out;
                    end
                    2'b01: Y = arithmetic_out;  // Subtraction
                    // Add more arithmetic operations as needed
                    default: Y = 4'b0000; // Default
                endcase
            end

            2'b10: Y = shift_out; // Shift operations

            2'b11: begin  // Division
                Y = quotient_out;
                remainder = remainder_out;
                valid_div = 1'b1;
            end

            default: Y = 4'b0000; // Default case
        endcase
    end
endmodule




