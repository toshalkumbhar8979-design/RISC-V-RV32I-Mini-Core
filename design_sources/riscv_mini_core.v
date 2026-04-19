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


module riscv_mini_core(
    input clk,
    input reset,
    // The ONLY physical ports going to the Basys 3 hardware
    output [6:0] seg,        
    output [3:0] an          
);

    // Internal signals - These stay INSIDE the FPGA fabric
    reg [31:0] pc;
    wire [31:0] alu_result;
    reg [31:0] reg_file [0:31];

    // Dummy Instruction (Normally from instruction_mem)
    // You can replace this wire with your actual instruction memory output
    wire [31:0] instr = 32'h00000000; 

    // Instruction Decoding
    wire [6:0] opcode = instr[6:0];
    wire [4:0] rd     = instr[11:7];
    wire [2:0] funct3 = instr[14:12];
    wire [4:0] rs1    = instr[19:15];
    wire [4:0] rs2    = instr[24:20];

    // Program Counter Logic
    always @(posedge clk or posedge reset) begin
        if (reset) 
            pc <= 32'h0000_0000;
        else 
            pc <= pc + 4;
    end

    // ALU Logic (Execute Stage)
    assign alu_result = (opcode == 7'b0110011) ? 
                            (funct3 == 3'b000) ? (reg_file[rs1] + reg_file[rs2]) : 
                            (funct3 == 3'b111) ? (reg_file[rs1] & reg_file[rs2]) : 
                            (funct3 == 3'b110) ? (reg_file[rs1] | reg_file[rs2]) : 
                            32'h0 : 32'h0;

    // Register Writeback
    integer i;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) reg_file[i] <= 32'h0;
        end else begin
            if (opcode == 7'b0110011 && rd != 5'b0) begin
                reg_file[rd] <= alu_result;
            end
        end
    end

    // Hardware Visualization - Shows ALU Result on 7-Segment
    hex_to_7seg display_unit (
        .clk(clk),
        .data(alu_result[15:0]), 
        .seg(seg),
        .an(an)
    );

endmodule