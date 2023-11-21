`timescale 1ns / 1ps

module DataMemory(
input [31:0]mr,
input [31:0]mqb,
input mwmem,
input clk,

output reg [31:0]mdo);
reg [31:0] memory[0:63];

 initial begin
memory[0] = 32'hA00000AA;
memory[1] = 32'h10000011;
memory[2] = 32'h20000022;
memory[3] = 32'h30000033;
memory[4] = 32'h40000044;
memory[5] = 32'h50000055;
memory[6] = 32'h60000066;
memory[7] = 32'h70000077;
memory[8] = 32'h80000088;
memory[9] = 32'h90000099;
       /* 
memory[10] = 32'd0;
memory[11] = 32'd0;
memory[12] = 32'd0;
memory[13] = 32'd0;
memory[14] = 32'd0;
memory[15] = 32'd0;
memory[16] = 32'd0;
memory[17] = 32'd0;
memory[18] = 32'd0;
memory[19] = 32'd0;
memory[20] = 32'd0;
memory[21] = 32'd0;
memory[22] = 32'd0;
memory[23] = 32'd0;
memory[24] = 32'd0;

memory[27] = 32'd0;
memory[28] = 32'd0;
memory[29] = 32'd0;
memory[30] = 32'd0;
memory[31] = 32'd0;
memory[32] = 32'd0;
memory[33] = 32'd0;
memory[34] = 32'd0;
memory[35] = 32'd0;
memory[36] = 32'd0;
memory[37] = 32'd0;
memory[38] = 32'd0;
memory[39] = 32'd0;
memory[40] = 32'd0;
memory[41] = 32'd0;
memory[42] = 32'd0;
memory[43] = 32'd0;
memory[44] = 32'd0;
memory[45] = 32'd0;
memory[46] = 32'd0;
memory[47] = 32'd0;
memory[48] = 32'd0;
memory[49] = 32'd0;
memory[50] = 32'd0;
memory[51] = 32'd0;
memory[52] = 32'd0;
memory[53] = 32'd0;
memory[54] = 32'd0;
memory[55] = 32'd0;
memory[56] = 32'd0;
memory[57] = 32'd0;
memory[58] = 32'd0;
memory[59] = 32'd0;
memory[60] = 32'd0;
memory[61] = 32'd0;
memory[62] = 32'd0;
memory[63] = 32'd0;
       */
    end

always @(*)begin
        mdo <= memory[mr[7:2]]; 
    end
    
always @(negedge clk)begin
       if (mwmem)begin
                memory[mr[7:2]] <= mqb;
            end 
    end
endmodule
