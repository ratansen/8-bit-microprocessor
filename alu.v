module alu (clock, reset, x, y, operation, out, flags);
    input clock, reset;
    input [7:0] x;      // 8 bit x
    input [7:0] y;      // 8 bit y
    input [3:0] operation;      // 16 possible operations
    output [15:0] out;       // 16 bit output, can be made 8 bit
    output [3:0] flags; //carry, zero and neg flags

    always @(*) begin
        result[15:0] = 16'd0;
    end

    case (operation)
        4'b0000: begin
            
        end
    endcase

    // calculations have been done, now we have to send it to the databus, whenever required
    // ---> alu latch
endmodule