`timescale 1ns / 1ps
module five_input_decoder(
    input [4:0] in,
    output [31:0] out
);
    wire [3:0] in1;
    assign in1 = in[3:0];  // Direk atama

    wire [15:0] out1;
    wire not_i4 = ~in[4];
    wire [15:0] out2;

    four_input_decoder dec1(
        .in(in1),
        .out(out1)
    );

    four_input_decoder dec2(
        .in(in1),
        .out(out2)
    );

    genvar j;
    generate

        for (j = 0; j < 16; j = j + 1) begin : assign_out1
            assign out[j] = out1[j] &not_i4 ;
        end
        /*

	inputta 5. bit değeri 0'sa ilk 16 bit üzerinde işlem yaparız ilk 16 bitimiz
 	inputumuzdali ilk 4 bitimizin 4 bitlik decoder outputu ile 5. bitimizin 0 olmasıyla
 	değerlendirilir.

	*/

        for (j = 16; j < 32; j = j + 1) begin : assign_out2
            assign out[j] = out2[j-16] & in[4];
        end

        /*

	inputta 5. bit değeri 1'sa ikinci 16 bit üzerinde işlem yaparız ikinci 16 bitimiz
	inputumuzdali ilk 4 bitimizin 4 bitlik decoder outputu ile 5. bitimizin 1 olmasıyla
 	değerlendirilir.

	*/ 

    endgenerate

endmodule
