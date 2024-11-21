`timescale 1ns / 1ps

module four_bit_adder_subtractor_tb;

  // Girişler
  reg [3:0] A;
  reg [3:0] B;
  reg M;

  // Çıkışlar
  wire [4:0] C;
  wire V;
  wire [3:0] S;

  // Test edilen modül örneği
  four_bit_adder_subtractor uut (
    .A(A),
    .B(B),
    .M(M),
    .C(C),
    .V(V),
    .S(S)
  );

  // Değişkenleri her değiştiğinde zamanla birlikte göstermek için $monitor kullanılır
  initial begin
    $monitor("Time = %10dns, A = %5b, B = %5b, M = %5b, S = %5b, C = %5b, V = %5b", $time, A, B, M, S, C, V);
    
    // Test başlatılıyor
    $display("Starting test...");

    // Test 1: A = 5, B = 3, Toplama (M = 0)
    A = 4'b0101; // 5
    B = 4'b0011; // 3
    M = 0;       // Toplama
    #20;

    // Test 2: A = 5, B = 3, Çıkarma (M = 1)
    A = 4'b0101; // 5
    B = 4'b0011; // 3
    M = 1;       // Çıkarma
    #20;

    // Test 3: A = 8, B = 4, Toplama (M = 0)
    A = 4'b1000; // 8
    B = 4'b0100; // 4
    M = 0;       // Toplama
    #20;

    // Test 4: A = 8, B = 4, Çıkarma (M = 1)
    A = 4'b1000; // 8
    B = 4'b0100; // 4
    M = 1;       // Çıkarma
    #20;

    // Test 5: A = 7, B = 7, Toplama (M = 0)
    A = 4'b0111; // 7
    B = 4'b0111; // 7
    M = 0;       // Toplama
    #20;

    // Test 6: A = 7, B = 7, Çıkarma (M = 1)
    A = 4'b0111; // 7
    B = 4'b0111; // 7
    M = 1;       // Çıkarma
    #20;

    // Test 7: Pozitif taşma testi (Overflow), A = 7, B = 2, Toplama (M = 0)
    A = 4'b0111; // 7
    B = 4'b0010; // 2
    M = 0;       // Toplama
    #20;

    // Test 8: Negatif taşma testi (Overflow), A = -8, B = -1, Toplama (M = 0)
    A = 4'b1000; // -8 (iki'nin tümleyeni gösterimi)
    B = 4'b1111; // -1 (iki'nin tümleyeni gösterimi)
    M = 0;       // Toplama
    #20;

    // Test bitti
    $display("Test completed.");
    $stop;
  end

endmodule
