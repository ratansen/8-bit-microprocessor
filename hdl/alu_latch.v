module alu_latch(
    input [7:0] A, B, C, D,
    input sub,
    input out_en,
    input [3:0] op_new,
    output cout,
    output [7:0] out
);
    wire [7:0] dmux0, dmux1, tc_out, B_in, add_sub_out, C_in, D_in;
    parameter cin_adder = 1'b0;


    alu r1(
        .a(A), .b(B), .cin(cin_adder), .sub(sub) ,.operation(op_new),
        .sum(add_sub_out), .cout(cout)
    );

    wire add_sub_low_out_en = ~out_en;

    tribuf_8bit tri8(
        .in(add_sub_out), .out(out),
        .low_enable(add_sub_low_out_en)
    );
endmodule
