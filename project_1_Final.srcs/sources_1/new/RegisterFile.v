`timescale 1ns / 1ps

module RegisterFile(
    input [4:0] rs,
    input [4:0] rt,
    
    input [4:0] wdestReg,
    input [31:0] wbData,
    input wwreg,
    input clk,
    
    output reg [31:0] qa,
    output reg [31:0] qb
    );
    reg [31:0] registers [0:31];
    
    initial begin
    
registers[0] = 32'hA00000AA;           
registers[1] = 32'h10000011;
registers[2] = 32'h20000022;
registers[3] = 32'h30000033;
registers[4] = 32'h40000044;
registers[5] = 32'h50000055;
registers[6] = 32'h60000066;
registers[7] = 32'h70000077;
registers[8] = 32'h80000088;
registers[9] = 32'h90000099;
       // registers[0] = 32'd0;
       // registers[1] = 32'd0;
       // registers[2] = 32'd0;
       // registers[3] = 32'd0;
       // registers[4] = 32'd0;
       // registers[5] = 32'd0;
       // registers[6] = 32'd0;
       // registers[7] = 32'd0;
        
       // registers[8] = 32'd0;
       // registers[9] = 32'd0;
        registers[10] = 32'd0;
        registers[11] = 32'd0;
        registers[12] = 32'd0;
        registers[13] = 32'd0;
        registers[14] = 32'd0;
        registers[15] = 32'd0;
        
        registers[16] = 32'd0;
        registers[17] = 32'd0;
        registers[18] = 32'd0;
        registers[19] = 32'd0;
        registers[20] = 32'd0;
        registers[21] = 32'd0;
        registers[22] = 32'd0;
        registers[23] = 32'd0;
        
        registers[24] = 32'd0;
        registers[25] = 32'd0;
        registers[26] = 32'd0;
        registers[27] = 32'd0;
        registers[28] = 32'd0;
        registers[29] = 32'd0;
        registers[30] = 32'd0;
        registers[31] = 32'd0;
    end
    
    always @(*)begin
        qa <=registers[rs];
        qb <=registers[rt];
    end  
    
    always @(negedge clk)begin
        if (wwreg)begin
            registers[wdestReg] <= wbData;
        end
    end
endmodule
