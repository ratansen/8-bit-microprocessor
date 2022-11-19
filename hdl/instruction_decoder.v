// sap-1 instruction decoder

module instruction_decoder(op_code, lda, add, sub, out, low_halt,xor_ratna,and_ratna,or_ratna,cmp_ratna,lda_imm,sta_imm);
    input [3:0] op_code;
    output lda, add, sub, out, low_halt;
    output xor_ratna,or_ratna,and_ratna,cmp_ratna,lda_imm,sta_imm;
    //output [3:0] operation_new;
    //assign operation_new = op_code;
    assign lda = (op_code == 4'b0000);
    assign add = (op_code == 4'b0001);
    assign sub = (op_code == 4'b0010);
    assign xor_ratna = (op_code == 4'b0011);
    assign and_ratna = (op_code == 4'b0100);
    assign or_ratna = (op_code == 4'b0101);
    assign cmp_ratna = (op_code == 4'b0110);

    assign lda_imm = (op_code == 4'b0111);
    assign sta_imm = (op_code == 4'b1000);
   

    // always @(add | sub)
    // begin
    //     $display("load b =%b ",sub);
    // end
    assign out = (~op_code[0] & op_code[1] & op_code[2] & op_code[3]);
    assign low_halt = ~(op_code[0] & op_code[1] & op_code[2] & op_code[3]);
endmodule
