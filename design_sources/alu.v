`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2026 11:59:56
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] a, b,
    input [3:0] sel,
    output reg [31:0] out
);
    always @(*) begin
        case(sel)
            4'b0000: out = a + b;  // ADD
            4'b1000: out = a - b;  // SUB
            default: out = 32'b0;
        endcase
    end
endmodule
