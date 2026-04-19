`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2026 13:17:40
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(
    input [31:0] addr,
    output [31:0] instr
);
    // Hardcoded instructions for testing:
    // x1 = 5, x2 = 10 (Set manually in TB)
    // Addr 0: ADD x3, x1, x2 -> Machine Code: 32'h002081B3
    // Addr 4: AND x4, x3, x1 -> Machine Code: 32'h0011F233
    
    assign instr = (addr == 32'h0) ? 32'h002081B3 : 
                   (addr == 32'h4) ? 32'h0011F233 : 32'h0;
endmodule
