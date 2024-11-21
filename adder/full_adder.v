`timescale 1ns / 1ps
module full_adder(input input_1, input_2, c_in, output sum, c_out);
wire sum_1, carry_1, carry_2;

half_adder ha_1(.input_1(input_1),.input_2(input_2),.sum(sum_1),.carry(carry_1));
half_adder ha_2(.input_1(sum_1),.input_2(c_in),.sum(sum),.carry(carry_2));


//c_out = carry_1 + carry_2
wire w1,w2;
nand
G1(w1,carry_1,carry_1),
G2(w2,carry_2,carry_2),
G3(c_out,w1,w2);
endmodule
