//`timescale 1ns / 1ps
//module dFlipFlop (
//    input clk, D,
//    output state, reState
//);
//    wire [3:0] w;
//    assign w[0] = ~(D & w[2]) ;
//    assign w[1] = ~(w[0] & w[3]) ;
//    assign w[2] = ~(w[3] & w[0] & clk) ;
//    assign w[3] = ~(clk & w[1]) ;


//    assign state = ~(w[3] & reState);
//    assign reState = ~(w[2] & state);
    
//endmodule

module dFlipFlop (
    input clk, D,
    output reg state, reState
);
    always @(posedge clk) begin // the logic behind using clock is to not change anything before clock hits
        state <= D;
        reState <= ~D;
    end
endmodule
