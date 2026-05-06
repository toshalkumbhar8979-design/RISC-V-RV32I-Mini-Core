`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2026 17:11:02
// Design Name: 
// Module Name: pipeline_ctrl
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


module pipeline_ctrl(
    input clock, reset,
    input [31:0] instruction,
    output stall_out
);
    assign stall_out = 1'b0; // Fixed to 0 to keep logic path clear for now
endmodule
