`timescale 1ns / 1ps

module ForwardingMultiplexerA(
input [31:0] qa, input [31:0] r, input [31:0] mr, input [31:0] mdo, input [1:0] fwda
, output reg [31:0] fwdao
);

    always @ (*)begin
                if (fwda == 2'b00)begin 
                    fwdao <= qa;
                end
                if (fwda == 2'b01)begin 
                    fwdao <= r;
                end
                if (fwda == 2'b10)begin 
                    fwdao <= mr;
                end
                if (fwda == 2'b11)begin 
                    fwdao <= mdo;
                end
    end
endmodule
