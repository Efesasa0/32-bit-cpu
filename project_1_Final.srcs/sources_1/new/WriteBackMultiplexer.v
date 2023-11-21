`timescale 1ns / 1ps

module WriteBackMultiplexer(
    input [31:0] wr,
    input [31:0] wdo,
    input wm2reg,
    
    output reg [31:0] wbData);
    
    always @(wm2reg) begin
            if (wm2reg)begin
                wbData <= wdo;
            end
            else begin
                wbData <= wr;
            end
    end
endmodule
