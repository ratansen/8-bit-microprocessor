// sap-1 instruction decoder

//module instruction_decoder(op_code, lda, add, sub, out, low_halt,xor_ratna,and_ratna,or_ratna,cmp_ratna,lda_imm,sta_imm);
module instruction_decoder(op_code, lda, store, move, move_imm, add, add_imm, sub, sub_imm, compare, cmp_imm, and_ratna, and_imm, or_ratna , or_imm, xor_ratna, xor_imm, low_halt);
    input [3:0] op_code;
    //output lda, add, sub, out, low_halt;
    //output xor_ratna,or_ratna,and_ratna,cmp_ratna,lda_imm,sta_imm;
    output lda, store, move, move_imm, add, add_imm, sub, sub_imm, low_halt;
    output compare, cmp_imm, and_ratna, and_imm, or_ratna , or_imm, xor_ratna, xor_imm;
    //output [3:0] operation_new;
    //assign operation_new = op_code;
    // assign lda = (op_code == 4'b0000);
    // assign add = (op_code == 4'b0001);
    // assign sub = (op_code == 4'b0010);
    // assign xor_ratna = (op_code == 4'b0011);
    // assign and_ratna = (op_code == 4'b0100);
    // assign or_ratna = (op_code == 4'b0101);
    // assign cmp_ratna = (op_code == 4'b0110);

    // assign lda_imm = (op_code == 4'b0111);
    // assign sta_imm = (op_code == 4'b1000);
    /////////////////////////////////////////////
    assign lda = (op_code == 4'b0000);
    assign store = (op_code == 4'b0001);
    assign move = (op_code == 4'b0011);
    assign move_imm = (op_code == 4'b0010);
    assign add = (op_code == 4'b0100);
    assign add_imm = (op_code == 4'b1100);
    assign sub = (op_code == 4'b0101);
    assign sub_imm = (op_code == 4'b1101);
    assign compare = (op_code == 4'b0111);
    //assign cmp_imm = (op_code == 4'b1111);
    assign and_ratna = (op_code == 4'b0110);
    assign and_imm = (op_code == 4'b1110);
    assign or_ratna = (op_code == 4'b1000);
    assign or_imm = (op_code == 4'b1001);
    assign xor_ratna = (op_code == 4'b1010);
    assign xor_imm = (op_code == 4'b1011);
    ////////////////////////////////////////////

    // always @(add | sub)
    // begin
    //     $display("load b =%b ",sub);
    // end
    assign out = (~op_code[0] & op_code[1] & op_code[2] & op_code[3]);
    assign low_halt = ~(op_code[0] & op_code[1] & op_code[2] & op_code[3]);
endmodule
