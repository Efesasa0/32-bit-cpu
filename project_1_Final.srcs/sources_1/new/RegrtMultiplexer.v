`timescale 1ns / 1ps

module RegrtMultiplexer(input [4:0] rt, input [4:0] rd, input regrt, output reg [4:0] destReg);
    always @ (*)begin
            if (regrt)begin
                destReg <= rt;
            end
            else begin
                destReg <= rd;
            end
    end
endmodule
