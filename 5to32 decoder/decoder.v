`timescale 1ns / 1ps

module decoder (
    input [2:0] in,
    input enable,
    output [7:0] D
);
    wire [2:0] w;

    // Girişlerin tersini al
    assign w = ~in;

    // Çıkışları tanımla
    assign D[0] = w[0] & w[1] & w[2] & enable; // 000
    assign D[1] = in[0] & w[1] & w[2] & enable; // 001
    assign D[2] = w[0] & in[1] & w[2] & enable; // 010
    assign D[3] = in[0] & in[1] & w[2] & enable; // 011
    assign D[4] = w[0] & w[1] & in[2] & enable; // 100
    assign D[5] = in[0] & w[1] & in[2] & enable; // 101
    assign D[6] = w[0] & in[1] & in[2] & enable; // 110
    assign D[7] = in[0] & in[1] & in[2] & enable; // 111
        
endmodule
