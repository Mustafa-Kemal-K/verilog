module jkff (
    input J, K, clk,
    output state, reState
);
    wire D;
    assign D = (J & reState) | (~K & state); // JK logic
    dFlipFlop JKFF1 (
        .clk(clk),
        .D(D),
        .state(state),
        .reState(reState)
    );
endmodule
