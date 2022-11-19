module alu(
    input [7:0] a, b,
    input cin,
    input sub,
    input [3:0] operation,
    output [7:0] sum,
    output cout
);

    reg [7:0] temp;

    always @(*) begin
        if(operation == 4'b0001) temp = a + b;
        else if(operation == 4'b0010) 
        temp = a - b;
        else if(operation == 4'b0011)
        temp = a | b;
        else if(operation == 4'b0100) 
        temp = a & b;
        else if(operation == 4'b0101)
        temp = a ^ b;
        else if(operation == 4'b0110) 
        temp = ~a;
        else if(operation == 4'b0111)
        temp = b;
        else if(operation == 4'b1000) 
        temp = b;
        
    end
    
    assign sum = temp;
endmodule
