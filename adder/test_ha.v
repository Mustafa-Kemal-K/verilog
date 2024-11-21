`timescale 1ns / 1ps


module test_ha;
reg A,B;
wire C,S;
half_adder test(.input_1(A), .input_2(B), .sum(S), .carry(C));
initial begin
#0
A=1'b0;B=1'b1;
#10
A=1'b1;B=1'b0;
#10
B=1'b1;
#10
A=1'b0;B=1'b0;
end
initial #40 $stop;
endmodule
