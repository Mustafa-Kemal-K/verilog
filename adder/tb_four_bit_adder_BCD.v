`timescale 1ns / 1ps

module tb_four_bit_adder_BCD;

    // Testbench için girişler
    reg [3:0] i1;
    reg [3:0] i2;
    reg c_in;
    
    // Testbench için çıkışlar
    wire c_use;
    wire [3:0] S;
    wire [4:0] c_out;

    // Test edilen modül
    four_bit_adder_BCD uut (
        .i1(i1),
        .i2(i2),
        .c_in(c_in),
        .c_use(c_use),
        .S(S),
        .c_out(c_out)
    );

    // Test senaryolarını tanımlama
    initial begin
        // Başlangıç değerleri
        c_in = 0;
        
        // Senaryo 1: 5 + 3
        i1 = 4'b0101; // 5
        i2 = 4'b0011; // 3
        #10;
        $display("5 + 3 = %d, c_use: %b, S: %b, c_out: %b", S, c_use, S, c_out);
        
        // Senaryo 2: 9 + 1 (düzeltme gerektirir)
        i1 = 4'b1001; // 9
        i2 = 4'b0001; // 1
        #10;
        $display("9 + 1 = %d, c_use: %b, S: %b, c_out: %b", S, c_use, S, c_out);
        
        // Senaryo 3: 7 + 2
        i1 = 4'b0111; // 7
        i2 = 4'b0010; // 2
        #10;
        $display("7 + 2 = %d, c_use: %b, S: %b, c_out: %b", S, c_use, S, c_out);
        
        // Senaryo 4: 8 + 8 (düzeltme gerektirir)
        i1 = 4'b1000; // 8
        i2 = 4'b1000; // 8
        #10;
        $display("8 + 8 = %d, c_use: %b, S: %b, c_out: %b", S, c_use, S, c_out);
        
        // Senaryo 5: 9 + 9 (düzeltme gerektirir)
        i1 = 4'b1001; // 9
        i2 = 4'b1001; // 9
        #10;
        $display("9 + 9 = %d, c_use: %b, S: %b, c_out: %b", S, c_use, S, c_out);
        
        // Senaryo 6: 0 + 0
        i1 = 4'b0000; // 0
        i2 = 4'b0000; // 0
        #10;
        $display("0 + 0 = %d, c_use: %b, S: %b, c_out: %b", S, c_use, S, c_out);
        
        // Senaryo 7: 6 + 4 (düzeltme gerektirir)
        i1 = 4'b0110; // 6
        i2 = 4'b0100; // 4
        #10;
        $display("6 + 4 = %d, c_use: %b, S: %b, c_out: %b", S, c_use, S, c_out);
        
        // Simülasyonu durdur
        $finish;
    end
endmodule
