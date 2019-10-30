`ifndef MUX16TO1
`define MUX16TO1
`include "mux4to1_glvl.v"

    module mux16to1_glvl(
        output outp,
        input [15:0] inp,
        input [3:0] sel
    );

    genvar i;

    wire [3:0] muxOuts;

    generate for(i = 0; i < 4; i = i+1) begin : mux4to1

        mux4to1_glvl mux(.outp(muxOuts[i]), .inp(inp[i+:4]), .sel(sel[2+:2]));

    end
    endgenerate

    mux4to1_glvl endMux(.outp(outp), .inp(muxOuts), .sel(sel[0+:2]));

    endmodule

`endif