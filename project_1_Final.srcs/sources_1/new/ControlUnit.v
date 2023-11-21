`timescale 1ns / 1ps
module ControlUnit(
    input [5:0]op,
    input [5:0]func,
    
    input [4:0]rs,
    input [4:0]rt,
    input [4:0]mdestReg,
    input mm2reg,
    input mwreg,
    input [4:0]edestReg,
    input em2reg,
    input ewreg,
    
    output reg[31:0]wpcir,
    output reg[1:0]fwda,
    output reg[1:0]fwdb,
    
    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg [3:0] aluc,
    output reg aluimm,
    output reg regrt
    );
    initial begin
        fwdb = 2'b00; 
        fwda = 2'b00;
    end
    
    always @(*)begin
        fwdb <= 2'b00; 
        fwda <= 2'b00;
    
        if (rs == edestReg)begin 
                    fwda <= 2'b01;
                end
        if (rt == edestReg)begin 
                    fwdb <= 2'b01;
                end
        if (rs == mdestReg)begin 
                    fwda <= 2'b10;
                    
                    if(op == 6'b100011)begin
                        fwda <= 2'b11;
                    end
                end
        if (rt == mdestReg)begin 
                    fwdb <= 2'b10;
                end         
                
        case (op)
            6'b000000:
            begin // r-type
                case (func)
                    6'b100000: // ADD
                    begin
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b0010;
                        aluimm <= 0;
                        regrt <= 0;
                    end 
                    6'b100101: // OR
                    begin
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b0001;
                        aluimm <= 0;//                        ????????
                        regrt <= 0;//                        ????????
                    end  
                    6'b100010: // SUB
                    begin
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b0110; 
                        aluimm <= 0; //                        ????????
                        regrt <= 0; //                      ????????
                    end  
                    6'b100110: // XOR
                    begin
                        wreg <= 1;//                        ????????
                        m2reg <= 0;//                        ????????
                        wmem <= 0;//                        ????????
                        aluc <= 4'b1001;//                        ????????
                        aluimm <= 0;//                        ????????
                        regrt <= 0;//                        ????????
                    end  
                    6'b100000: // AND
                    begin
                        wreg <= 1;
                        m2reg <= 0;
                        wmem <= 0;
                        aluc <= 4'b0000;
                        aluimm <= 0;                //?????
                        regrt <= 0;                     //??????
                    end 
                endcase
            end
            
            6'b100011:
            begin // LW
                wreg <= 1;
                m2reg <= 1;
                wmem <= 0;
                aluc <= 4'b0010;
                aluimm <= 1;
                regrt <= 1;  
            end
        endcase
    end
    
endmodule
