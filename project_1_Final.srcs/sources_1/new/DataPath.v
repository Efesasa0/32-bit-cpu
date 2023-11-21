`timescale 1ns / 1ps

module DataPath(
    input clock,
    
    //remove all
    /*
        output wire [31:0] pc,
        output wire [31:0] dinstOut,
        output wire ewreg,
        output wire em2reg,
        output wire ewmem,
        output wire [3:0] ealuc,
        output wire ealuimm,
        output wire [4:0] edestReg,
        output wire [31:0] eqa,
        output wire [31:0] eqb,
        output wire [31:0] eimm32,
       //remove all */
    
    
    
    //MEMWBPipeline i/o
    output wire mwreg,
    output wire mm2reg,
    output wire [4:0] mdestReg,
    output wire [31:0] mr,
    output wire [31:0] mdo,
        
        output wire wwreg,
        output wire wm2reg,
        output wire [4:0] wdestReg,
        output wire [31:0] wr,
        output wire [31:0] wdo,
    
    //RegFile i/o
    output wire [4:0] rs,
    output wire [4:0] rt,
    //output wire [4:0] wdestReg,
    output wire [31:0] wbData,
    //output wire wwreg,
    
        output wire [31:0] qa,
        output wire [31:0] qb
    
     );
     
    wire [31:0]nextPc;
    wire [31:0]wpcir;          
    wire [31:0] pc;                              
    ProgramCounter programCounter(wpcir,nextPc,clock,pc);       
    //---
    
    PcAdder pcAdder(pc, nextPc); 
    //---
    
    wire [31:0]instOut;
    InstructionMemory instructionMemory(pc, instOut);
    //---
    
    wire [31:0] dinstOut;                                                  
    IFIDPipelineRegister iFIDPipelineRegister(wpcir, instOut, clock, dinstOut);
    //---
    
  
    wire [5:0]op = dinstOut[31:26];
    wire [5:0]func = dinstOut[5:0];
    assign rs = dinstOut[25:21];
    assign rt = dinstOut[20:16];
    
    wire [4:0]edestReg;
    wire em2reg;
    wire ewreg;

    
    wire [31:0]wpcir;
    wire[1:0]fwda;
    wire[1:0]fwdb;
    
    wire wreg;
    wire m2reg;
    wire wmem;
    wire [3:0] aluc;
    wire aluimm;
    wire regrt;
    ControlUnit controlUnit(op, func, rs, rt, mdestReg, mm2reg, mwreg, edestReg, em2reg, ewreg, wpcir, fwda, fwdb , wreg, m2reg, wmem, aluc, aluimm, regrt);
    //---
    
    wire [4:0] destReg;
    wire [4:0] rd = dinstOut[15:11];
    RegrtMultiplexer regrtMultiplexer(rt, rd, regrt, destReg);
    //---
    
    wire [31:0] fwdao;
    wire [31:0] fwdbo;
    wire [31:0] r;
    ForwardingMultiplexerA forwardingMultiplexerA(qa, r, mr, mdo, fwda, fwdao);
    ForwardingMultiplexerB forwardingMultiplexerB(qb, r, mr, mdo, fwdb, fwdbo);
    //---
    
    wire [15:0]imm = dinstOut[15:0];// what value initially??
    wire [31:0]imm32;
    ImmediateExtender immediateExtender(imm, imm32);
    //---
    
    wire ewreg;
    wire em2reg;
    wire ewmem;
    wire [3:0] ealuc;
    wire ealuimm;
    wire [4:0] edestReg;
    wire [31:0] eqa;
    wire [31:0] eqb;
    wire [31:0] eimm32;

    IDEXEPipelineRegister iDEXEPipelineRegister(wreg, m2reg, wmem, aluc, aluimm, destReg, fwdao, fwdbo, imm32, clock,
    ewreg, em2reg, ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32);
    //---

    //Lab4 part
    
    wire [31:0] b;
    AluMux aluMux(eqb,eimm32, ealuimm, b);
    //---
    
    
    Alu alu(eqa, b, ealuc, r);
    //---
    
    wire mwmem;
    wire [31:0] mqb;
    EXEMEMPipelineRegister eXEMEMPipelineRegister(ewreg, em2reg, ewmem, edestReg, r, eqb, clock,
    mwreg, mm2reg, mwmem, mdestReg, mr, mqb);
    //---
    
    DataMemory dataMemory(mr, mqb, mwmem, clock, mdo);
    //---
    
    MEMWBPipelineRegister mEMWBPipelineRegister(mwreg, mm2reg, mdestReg, mr, mdo, clock, 
    wwreg, wm2reg, wdestReg, wr, wdo);
    //---
    
    
    WriteBackMultiplexer writeBackMultiplexer(wr, wdo, wm2reg, wbData);
    
    RegisterFile registerFile(rs,rt,wdestReg,wbData,wwreg,clock,qa,qb);

    
endmodule

//initialize all
//call all in right order

//Program Counter -> PcAdder -> Instruction memory -> ifid pipeline reg -> control unit -> regrt multi 
//-> reg file -> immextender --> IDExe pipeline reg
