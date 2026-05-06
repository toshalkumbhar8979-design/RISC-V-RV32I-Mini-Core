`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2026 12:19:03
// Design Name: 
// Module Name: decode_stage
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
module decode(
    input clock, reset, stall,
    input [31:0] instruction, pc_in,
    output reg [3:0] alu_fns_sel,
    output [4:0] rs1_addr, rs2_addr, rd_addr,
    output reg [31:0] pc_out
);
    assign rd_addr  = instruction[11:7];
    assign rs1_addr = instruction[19:15];
    assign rs2_addr = instruction[24:20];

    always @(posedge clock) begin
        if (reset) begin
            alu_fns_sel <= 4'b0;
            pc_out <= 32'h0;
        end else if (!stall) begin
            pc_out <= pc_in;
            alu_fns_sel <= instruction[14:12];
        end
    end
endmodule
