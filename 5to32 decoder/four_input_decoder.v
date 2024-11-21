`timescale 1ns / 1ps

module four_input_decoder(
    input [3:0] in,        // 4-bit giriş
    output [15:0] out      // 16-bit çıkış
);
    wire [2:0] in1;        // 3-bit iç giriş
    assign in1 = in[2:0];  // in[2:0]'ı in1'e atama (ilk 3 bit)

    wire [7:0] out1 = 8'b0;  // Varsayılan değer olarak sıfır atanmış 8-bit çıkış (dec1 için)
    wire [7:0] out2 = 8'b0;  // Varsayılan değer olarak sıfır atanmış 8-bit çıkış (dec2 için)

    // İlk decoder: Enable sinyali in[3]'ün tersine bağlı
    // Eğer in[3] = 0 ise, bu decoder aktif olur
    decoder dec1 (
        .in(in1),            // in1'i decoder'a ilet
        .enable(~in[3]),     // Enable sinyali, in[3] tersine çevrilir
        .D(out1)             // Çıkış out1'e bağlanır
    );

    // İkinci decoder: Enable sinyali in[3]'e bağlı
    // Eğer in[3] = 1 ise, bu decoder aktif olur
    decoder dec2 (
        .in(in1),            // in1'i decoder'a ilet
        .enable(in[3]),      // Enable sinyali, in[3]'ün kendisi kullanılır
        .D(out2)             // Çıkış out2'ye bağlanır
    );

    // Çıkışların atanması: out1 ve out2'yi birleştirerek 16-bitlik çıkış oluşturulur
    // soldan ilk 8 bit out2, sonraki 8 bit out1'dir
    assign out = {out2, out1}; // out2 önce, sonra out1 gelir

endmodule
