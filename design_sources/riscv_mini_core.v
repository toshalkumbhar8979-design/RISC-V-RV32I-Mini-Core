`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2026 13:16:13
// Design Name: 
// Module Name: riscv_mini_core
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


(* DONT_TOUCH = "yes" *)
module riscv_mini_core(
    input clk,
    input rst,
    output [15:0] core_out
);

    (* DONT_TOUCH = "yes" *) wire [31:0] idata_internal;
    (* DONT_TOUCH = "yes" *) wire [31:0] instr_fetch, pc_to_decode, pc_to_execute, execute_result, reg_file_out;
    wire [3:0] alu_sel;
    wire [4:0] rs1_addr, rs2_addr, rd_addr;
    wire stall_sig;

    assign core_out = reg_file_out[15:0];

    // ROM Implementation
    reg [31:0] rom [0:63]; 
    reg [31:0] idata_reg;
    integer i;

    initial begin
        rom[0] = 32'h00500093; // addi x1, x0, 5
        rom[1] = 32'h00a00113; // addi x2, x0, 10
        rom[2] = 32'h002081b3; // add x3, x1, x2
        for (i = 3; i < 64; i = i + 1) rom[i] = 32'h00000013;
    end

    always @(posedge clk) begin
        idata_reg <= rom[pc_to_decode[7:2]];
    end
    assign idata_internal = idata_reg;

    // Directing Vivado NOT to collapse these hierarchies
    pipeline_ctrl pc_unit (.clock(clk), .reset(rst), .instruction(instr_fetch), .stall_out(stall_sig));
    fetch fetch_inst (.clock(clk), .reset(rst), .stall(stall_sig), .idata(idata_internal), .instr_out(instr_fetch), .pc_out(pc_to_decode));
    decode decode_inst (.clock(clk), .reset(rst), .stall(stall_sig), .instruction(instr_fetch), .pc_in(pc_to_decode), .alu_fns_sel(alu_sel), .rs1_addr(rs1_addr), .rs2_addr(rs2_addr), .rd_addr(rd_addr), .pc_out(pc_to_execute));
    execute execute_inst (.clock(clk), .reset(rst), .alu_fn(alu_sel), .pc_in(pc_to_execute), .rd_addr_in(rd_addr), .result(execute_result));
    GPR_MEMORY gpr_inst (.clock(clk), .reset(rst), .regA_addr(rs1_addr), .regB_addr(rs2_addr), .regD_addr(rd_addr), .write_data(execute_result), .read_data_out(reg_file_out));

endmodule
