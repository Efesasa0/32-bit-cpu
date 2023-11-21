`timescale 1ns / 1ps

module InstructionMemory(
input [31:0] pc,
output reg [31:0] instOut);
    
    reg [31:0] memory[0:63];
    
    initial begin
        /*
        //# address  instruction            
        //100:       lw $2, 00($1)        
        memory[25] = {6'b100011, 5'b00001, 5'b00010, 16'b0000000000000000};
        
        //104:       lw $3, 04($1)        
        memory[26] = {6'b100011, 5'b00001, 5'b00011, 16'b0000000000000100};
        
        //100:       lw $4, 08($1)        
        memory[27] = {6'b100011, 5'b00001, 5'b00100, 16'b0000000000001000};
        
        //104:       lw $5, 12($1)        
        memory[28] = {6'b100011, 5'b00001, 5'b00101, 16'b0000000000001100};
        
        //104:       add $6, $2, $10        
        memory[29] = {6'b000000, 5'b00010, 5'b01010, 5'b00110, 5'b00000, 6'b100000};
        */
        //-------=---------------_-----
        
        //# address  instruction            
        //100:       add $3,$1, $2        
        memory[25] = {6'b000000, 5'b00001, 5'b00010, 5'b00011, 5'b00000, 6'b100000};
        
        //104:       sub $4, $9, $3        
        memory[26] = {6'b000000, 5'b01001, 5'b00011, 5'b00100, 5'b00000, 6'b100010};
        
        //100:       or $5, $3, $9      
        memory[27] = {6'b000000, 5'b00011, 5'b01001, 5'b00101, 5'b00000, 6'b100101};
        
        //104:       xor $6, $3, $9       
        memory[28] = {6'b000000, 5'b00011, 5'b01001, 5'b00110, 5'b00000, 6'b100110};
        
        //104:       and $7, $3, $9         
        memory[29] = {6'b000000, 5'b00011, 5'b01001, 5'b00111, 5'b00000, 6'b100000};
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
    
    always @(pc)begin
        instOut <= memory[pc[7:2]]; //instOut <= memory[pc];
    end

endmodule