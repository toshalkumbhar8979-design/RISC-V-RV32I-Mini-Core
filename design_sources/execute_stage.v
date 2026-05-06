`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2026 11:51:26
// Design Name: 
// Module Name: execute_stage
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
module execute(
    input clock, reset,
    input [3:0] alu_fn,
    input [31:0] pc_in,
    input [4:0] rd_addr_in,
    output reg [31:0] result
);
    always @(posedge clock) begin
        if (reset) result <= 32'h0;
        else result <= (pc_in + {28'h0, alu_fn}) + {27'h0, rd_addr_in};
    end
endmodule
