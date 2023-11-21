`timescale 1ns / 1ps

module PcAdder(input [31:0] pc, output reg [31:0] nextPc);
  
   always @(*)begin
       nextPc <= pc + 32'd4;
   end
endmodule
