`timescale 1ns / 1ps

module AluMux(input [31:0] eqb, input [31:0] eimm32, input ealuimm, output reg [31:0]b);
    always @ (*)begin
            if (ealuimm)begin
                b <= eimm32;
            end
            else begin
                b <= eqb;
            end
    end
endmodule
