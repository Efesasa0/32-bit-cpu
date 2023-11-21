`timescale 1ns / 1ps

//initial pc is 100 in decimal.
//on posedge clk, set pc the nextPc
module ProgramCounter(input [31:0] wpcir, input [31:0] nextPc, input clk, output reg [31:0] pc);
   initial begin
        pc = 32'd100;  
   end
   
   always @(posedge clk) begin
       pc <= nextPc;
   end
endmodule

