`timescale 1ns / 1ps
module tb_jkff();
    reg J, K, clk;
    wire state, reState;
    
    jkff test (
        .J(J),
        .K(K),
        .clk(clk),
        .state(state),
        .reState(reState)
    );
    
    initial begin
        // Clock generation
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        // Reset state before starting the tests
        J = 1'b0; K = 1'b1; #10; // Reset before starting the sequence
        
        // Stimulus
        J = 1'b1; K = 1'b0; #10; // Set output to 1
        J = 1'b1; K = 1'b1; #10; // Complement
        J = 1'b0; K = 1'b1; #10; // Reset
        J = 1'b1; K = 1'b1; #10; // Complement
        J = 1'b0; K = 1'b0; #10; // No change
        J = 1'b1; K = 1'b0; #10; // Set
        J = 1'b0; K = 1'b0; #10; // No change
        J = 1'b1; K = 1'b1; #10; // Complement
    end
    
    initial begin
        // Monitor signals
        $monitor("Time: %7t ns | J: %b | K: %b | clk: %b | state: %b | reState: %b", $time, J, K, clk, state, reState);
    end
    
    initial #100 $finish;
endmodule
