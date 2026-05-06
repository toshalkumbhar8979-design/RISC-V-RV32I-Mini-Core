`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2026 17:11:37
// Design Name: 
// Module Name: GPR_MEMORY
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
module GPR_MEMORY(
    input clock, reset,
    input [4:0] regA_addr, regB_addr, regD_addr,
    input [31:0] write_data,
    output [31:0] read_data_out
);
    reg [31:0] gpr [31:0];
    assign read_data_out = gpr[regD_addr];
    integer j;

    always @(posedge clock) begin
        if (reset) begin
            for (j=0; j<32; j=j+1) gpr[j] <= 32'h0;
        end else if (regD_addr != 5'b0) begin
            gpr[regD_addr] <= write_data;
        end
    end
endmodule
