`timescale 1ns / 1ps

module testbench(
//clk and the output wires.
);

    reg clock_tb;
    
    /*
    wire [31:0] pc_tb;
    wire  [31:0] dinstOut_tb;
    wire  ewreg_tb;
    wire  em2reg_tb;
    wire  ewmem_tb;
    wire  [3:0] ealuc_tb;
    wire  ealuimm_tb;
    wire  [4:0] edestReg_tb;
    wire  [31:0] eqa_tb;
    wire  [31:0] eqb_tb;
    wire  [31:0] eimm32_tb;
    
    */
    //EXEMEM outputs
     wire mwreg_tb;
     wire mm2reg_tb;
     wire [4:0] mdestReg_tb;
     wire [31:0] mr_tb;
     wire [31:0] mdo_tb;
     
     wire wwreg_tb;
     wire wm2reg_tb;
     wire [4:0] wdestReg_tb;
     wire [31:0] wr_tb;
     wire [31:0] wdo_tb;
     
     wire [4:0] rs_tb;
     wire [4:0] rt_tb;
    
     wire [31:0] wbData_tb;
     wire wwreg_tb;
    
     wire [31:0] qa_tb;
     wire [31:0] qb_tb;
     
    initial begin
    clock_tb = 0;
    end
    
    DataPath DataPath_tb(
    clock_tb,
    mwreg_tb,
    mm2reg_tb,
    mdestReg_tb,
    mr_tb,
    mdo_tb,
    wwreg_tb,
    wm2reg_tb,
    wdestReg_tb,
    wr_tb,
    wdo_tb,
    rs_tb,
    rt_tb,
    wbData_tb,
    qa_tb,
    qb_tb);
    
    always begin
        #5;
        clock_tb <= ~clock_tb;
    end

endmodule
