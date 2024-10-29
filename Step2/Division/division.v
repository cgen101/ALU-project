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