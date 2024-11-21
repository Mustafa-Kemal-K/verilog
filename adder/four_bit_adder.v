`timescale 1ns / 1ps
module four_bit_adder(
    input  [3:0] input_1, 
    input  [3:0] input_2, 
    input        c_in, 
    output [3:0] sum, 
    output [4:0] carry
);
    assign carry[0] = c_in;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin: full_adder_gen
            full_adder fa(.input_1(input_1[i]), .input_2(input_2[i]), .c_in(carry[i]), .sum(sum[i]), .c_out(carry[i+1]));
        end
    endgenerate
endmodule
