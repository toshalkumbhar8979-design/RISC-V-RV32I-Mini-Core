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
    output [31:0] inst
);
    reg [31:0] rom [0:63];

    initial begin
        // Simple program for testing:
        rom[0] = 32'h00a00093; // ADDI x1, x0, 10
        rom[1] = 32'h00508113; // ADDI x2, x1, 5
        rom[2] = 32'h002081b3; // ADD  x3, x1, x2
    end

    // Word-aligned access matching the diagram's addr_mem_1
    assign inst = rom[addr[7:2]];
endmodule
