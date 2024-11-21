`timescale 1ns / 1ps

module four_bit_adder_tb;

  // Girişler
  reg [3:0] input_1;
  reg [3:0] input_2;
  reg c_in;

  // Çıkışlar
  wire [3:0] sum;
  wire [4:0] carry;

  // Test edilen modül örneği
  four_bit_adder uut (
    .input_1(input_1),
    .input_2(input_2),
    .c_in(c_in),
    .sum(sum),
    .carry(carry)
  );

  // Değişkenleri her değiştiğinde zamanla birlikte göstermek için $monitor kullanılır
  initial begin
    $monitor("Time = %0dns, input_1 = %b, input_2 = %b, c_in = %b, sum = %b, carry = %b", $time, input_1, input_2, c_in, sum, carry);
    
    // Test başlatılıyor
    $display("Starting test...");

    // Test 1: 5 + 3, c_in = 0
    input_1 = 4'b0101; // 5
    input_2 = 4'b0011; // 3
    c_in = 0;         // Toplama
    #10; // 10 ns bekle

    // Test 2: 5 + 3, c_in = 1
    input_1 = 4'b0101; // 5
    input_2 = 4'b0011; // 3
    c_in = 1;         // 5 + 3 + 1
    #10;

    // Test 3: 8 + 4, c_in = 0
    input_1 = 4'b1000; // 8
    input_2 = 4'b0100; // 4
    c_in = 0;         // Toplama
    #10;

    // Test 4: 8 + 4, c_in = 1
    input_1 = 4'b1000; // 8
    input_2 = 4'b0100; // 4
    c_in = 1;         // 8 + 4 + 1
    #10;

    // Test 5: 7 + 7, c_in = 0
    input_1 = 4'b0111; // 7
    input_2 = 4'b0111; // 7
    c_in = 0;         // Toplama
    #10;

    // Test 6: 7 + 7, c_in = 1
    input_1 = 4'b0111; // 7
    input_2 = 4'b0111; // 7
    c_in = 1;         // 7 + 7 + 1
    #10;

    // Test 7: 15 + 1, c_in = 0 (Taşma durumu)
    input_1 = 4'b1111; // 15
    input_2 = 4'b0001; // 1
    c_in = 0;         // Toplama
    #10;

    // Test bitti
    $display("Test completed.");
    $stop;
  end

endmodule
