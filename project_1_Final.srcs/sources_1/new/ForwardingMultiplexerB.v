`timescale 1ns / 1ps
module ForwardingMultiplexerB(
input [31:0] qb, input [31:0] r, input [31:0] mr, input [31:0] mdo, input [1:0] fwdb
, output reg [31:0] fwdbo
    );
    always @ (*)begin
                if (fwdb == 2'b00)begin 
                    fwdbo <= qb;
                end
                if (fwdb == 2'b01)begin 
                    fwdbo <= r;
                end
                if (fwdb == 2'b10)begin 
                    fwdbo <= mr;
                end
                if (fwdb == 2'b11)begin 
                    fwdbo <= mdo;
                end
    end
endmodule
