`timescale 1ns / 1ps

module four_bit_adder_BCD(
    input   [3:0] i1,
    input   [3:0] i2,
    input         c_in,
    output        c_use,
    output [3:0] S,
    output [4:0] c_out
);

    wire [3:0] s;           // İlk adderdan gelen toplam
    wire w1, w2;            // BCD düzeltme mantığı için ara sinyaller
    wire [4:0] c;           // İlk adderdan gelen taşıma

    // İlk dört bitli adderın instansı
    four_bit_adder fa1(
        .input_1(i1),
        .input_2(i2),
        .c_in(c_in),
        .sum(s),
        .carry(c)
    );

    // BCD düzeltme mantığı
    // s > 9 veya taşıma varsa düzeltme yap
    assign w1 = (s[3] & (s[2] | s[1])); // s >= 10 durumu
    assign w2 = (s[2] & s[1]);           // 6'dan büyük durum
    or  G3(c_use, c[4], w1, w2); // Düzeltme sinyali

    wire [3:0] slide;       // Taşıma düzeltme sinyali
    assign slide[1] = c_use; // Düzeltme sinyali
    assign slide[2] = slide[1]; // Taşıma ile kaydır
    wire dummy;
    assign dummy = 0;       // İkinci adder için dummy taşıma

    // İkinci dört bitli adder, düzeltme ile
    four_bit_adder fa2(
        .input_1(s),
        .input_2(slide),
        .c_in(dummy),
        .sum(S),
        .carry(c_out)
    );

endmodule
