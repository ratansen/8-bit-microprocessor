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
        if(operation == 4'b0100 || operation == 4'b1100) 
        temp = a + b;
        else if(operation == 4'b0101 || operation == 4'b1101) 
        temp = a - b;
        else if(operation == 4'b1000  || operation == 4'b1001)
        temp = a | b;
        else if(operation == 4'b0110 || operation == 4'b1110) 
        temp = a & b;
        else if(operation == 4'b1010 || operation == 4'b1011)
        temp = a ^ b;
        
    end
    
    assign sum = temp;
endmodule
