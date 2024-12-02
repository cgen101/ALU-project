module testbench;
    // Common Inputs
    reg [3:0] A, B;          // 4-bit inputs
    reg carry_in;            // Carry-in for addition
    reg [1:0] shift_amt;     // Shift amount (0-3)
    reg shift_dir;           // Shift direction (0=left, 1=right)
    reg [1:0] opcode;        // Operation code for control

    // Common Outputs
    wire [3:0] Y_logic;      // Logic output
    wire [3:0] Sum;          // Addition output
    wire carry_out;          // Carry-out for addition
    wire [3:0] product_low;  // Multiplication low bits
    wire [3:0] product_high; // Multiplication high bits
    wire [3:0] quotient, remainder; // Division outputs
    wire valid_div;          // Division valid flag
    wire [3:0] Y_shift;      // Shift output

    // Instantiate Logic Modules
    and_4bit u_and (.Y(Y_logic), .A(A), .B(B));
    or_4bit u_or (.Y(Y_logic), .A(A), .B(B));
    nand_4bit u_nand (.Y(Y_logic), .A(A), .B(B));
    xor_4bit u_xor (.Y(Y_logic), .A(A), .B(B));

    // Instantiate Arithmetic Modules
    addition u_add (.A(A), .B(B), .carry_in(carry_in), .Sum(Sum), .carry_out(carry_out));
    multiplication u_mul (.A(A), .B(B), .product_low(product_low), .product_high(product_high));
    division u_div (.dividend(A), .divisor(B), .quotient(quotient), .remainder(remainder), .valid(valid_div));

    // Instantiate Shift Modules
    shift_2x4bit u_shift (.A(A), .amt(shift_amt), .dir(shift_dir), .Y(Y_shift));

    // Testbench Logic
    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, testbench);

        // Test Logic Operations
        opcode = 0; A = 4'b1010; B = 4'b1100; #10;
        opcode = 0; A = 4'b1111; B = 4'b0001; #10;

        // Test Arithmetic Operations
        opcode = 1; A = 4'b0110; B = 4'b0011; carry_in = 1'b0; #10;  // Addition
        opcode = 1; A = 4'b0110; B = 4'b0011; carry_in = 1'b1; #10;  // Addition with carry
        opcode = 1; A = 4'b1001; B = 4'b0010; #10;  // Multiplication
        opcode = 1; A = 4'b1010; B = 4'b0010; #10;  // Division

        // Test Shift Operations
        opcode = 2; A = 4'b1010; shift_amt = 2'b01; shift_dir = 1'b0; #10; // Left shift by 1
        opcode = 2; A = 4'b1010; shift_amt = 2'b10; shift_dir = 1'b1; #10; // Right shift by 2

        $finish;
    end

    // Monitor Output
    always @(*) begin
        case (opcode)
            2'b00: $display("Logic Op: A=%b, B=%b, Y_logic=%b", A, B, Y_logic);
            2'b01: $display("Arithmetic Op: A=%b, B=%b, Sum=%b, CarryOut=%b, ProductLow=%b, ProductHigh=%b, Quotient=%b, Remainder=%b, Valid=%b",
                             A, B, Sum, carry_out, product_low, product_high, quotient, remainder, valid_div);
            2'b10: $display("Shift Op: A=%b, ShiftAmt=%b, ShiftDir=%b, Y_shift=%b", A, shift_amt, shift_dir, Y_shift);
        endcase
    end
endmodule