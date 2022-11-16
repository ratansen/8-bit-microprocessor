module alu(
    input [7:0] a, b,
    input cin,
    input operation,
    output [7:0] sum,
    output cout
);

    reg [7:0] temp;

    always @(*) begin
        if(operation == 4'b0010) temp = a - b;
        else if(operation == 4'b0001) temp = a + b;
        else if(operation == 4'b0101) temp = a ^ b;
        else temp = a & b;
    end

    assign sum = temp;
endmodule
