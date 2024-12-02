module shift_1bit (Y, A);
    output [3:0] Y;
    input [3:0] A;
    assign Y = A << 1;
endmodule

module shift_2x4bit (
    input [3:0] A,
    input [1:0] amt,     
    input dir,           
    output reg [3:0] Y
);

    always @(*) begin
        case (amt)
            2'b00: Y = A; // No shift
            2'b01: begin
                if (dir == 1'b0) // Left shift by 1
                    Y = {A[2:0], 1'b0};
                else // Right shift by 1
                    Y = {1'b0, A[3:1]};
            end
            2'b10: begin
                if (dir == 1'b0) // Left shift by 2
                    Y = {A[1:0], 2'b00};
                else // Right shift by 2
                    Y = {2'b00, A[3:2]};
            end
            default: Y = 4'b0000; // Default case (should not happen)
        endcase
    end

endmodule