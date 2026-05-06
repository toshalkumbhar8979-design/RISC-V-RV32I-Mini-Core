`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2026 11:59:26
// Design Name: 
// Module Name: register_file
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


module GPR_MEMORY(
    input clock, reset,
    input [4:0] regA_addr, regB_addr, regD_addr,
    input [31:0] write_data,
    output [31:0] read_data_out
);
    reg [31:0] gpr [31:0];
    assign read_data_out = gpr[regD_addr];
    integer i;
    always @(posedge clock or posedge reset) begin
        if (reset) for (i=0; i<32; i=i+1) gpr[i] <= 32'h0;
        else if (regD_addr != 0) gpr[regD_addr] <= write_data;
    end
endmodule
