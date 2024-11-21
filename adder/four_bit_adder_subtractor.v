`timescale 1ns / 1ps

module four_bit_adder_subtractor(
    input  [3:0] A,
    input  [3:0] B,
    input        M,
    output [4:0] C,
    output       V,
    output [3:0] S
);

    wire [3:0] in_2;

    // in_2 sinyalini ayarlamak için M sinyalini kontrol eden yapıyı kullanıyoruz.
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin: gen_block
            // Eğer M=1 ise in_2[i] = ~B[i], M=0 ise in_2[i] = B[i]
            assign in_2[i] = M ? ~B[i] : B[i];
        end
    endgenerate

    // Adder/Subtractor modülü
    four_bit_adder addsub(.input_1(A), .input_2(in_2), .c_in(M), .sum(S), .carry(C));

    // Overflow tespiti için XOR işlemi kullanıyoruz
    assign V = C[3] ^ C[4];

endmodule
