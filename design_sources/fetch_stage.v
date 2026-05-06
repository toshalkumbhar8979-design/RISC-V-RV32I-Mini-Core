`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2026 12:21:58
// Design Name: 
// Module Name: fetch_stage
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
module fetch(
    input clock, reset, stall,
    input [31:0] idata,
    output reg [31:0] instr_out, pc_out
);
    always @(posedge clock) begin
        if (reset) begin
            pc_out <= 32'h0;
            instr_out <= 32'h0;
        end else if (!stall) begin
            pc_out <= pc_out + 4;
            instr_out <= idata;
        end
    end
endmodule
