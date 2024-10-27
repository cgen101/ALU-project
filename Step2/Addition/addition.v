`ifndef ADDITION_V
`define ADDITION_V

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

`endif