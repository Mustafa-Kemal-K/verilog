`timescale 1ns / 1ps

module half_adder(input input_1, input_2, output sum, carry);
//sum = input_1'.input_2 + input_1.input_2'
//carry = input_1.input_2
wire not_carry,not_1,not_2,w1,w2;
nand
G1(not_1,input_1,input_1), //INPUT1'
G2(not_2,input_2,input_2), //INPUT2'
G3(w1,not_2,input_1),      //(INPUT1.INPUT2')' = INPUT1'+INPUT2 = B
G4(w2,not_1,input_2),      //(INPUT1'.INPUT2)' = INPUT1+INPUT2' = A
G5(sum,w1,w2),             //A'+B' = I1 XOR I2
G6(not_carry,input_1,input_2), // (I1.I2)' = 
G7(carry, not_carry,not_carry);
endmodule
