`timescale 1ns / 1ps

module Alu(input [31:0] eqa, input [31:0] b, input [3:0]ealuc, output reg [31:0] r);
always @ (*)begin
            if (ealuc == 4'b0010)begin //add
                r <= eqa + b;
            end
            if (ealuc == 4'b0001)begin //or
                r <= eqa | b;
            end
            if (ealuc == 4'b0110)begin //sub
                r <= eqa - b;
            end
            if (ealuc == 4'b1001)begin //xor  
                r <= eqa ^ b;
            end
            if (ealuc == 4'b0000)begin //and   
                r <= eqa & b;
            end
    end
endmodule
// 0010 add
// 0110 subtract
// 0000 and
// 0001 or
// 1100 nor
