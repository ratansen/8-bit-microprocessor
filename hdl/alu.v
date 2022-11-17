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
        else if(operation == 4'b0011) 
            begin
            
            temp = a - b;
            $display("case 1 =%d ",a);
            end
        // else if(operation == 4'b0011) temp = a | b;
        $display("here = %b ",operation);
    end
    
    assign sum = temp;
endmodule
