`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2026 12:00:31
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [6:0] opcode, input [2:0] funct3, input [6:0] funct7,
    output reg reg_write, output reg [3:0] alu_op, output reg alu_src
);
    always @(*) begin
        reg_write = 0; alu_op = 4'b0010; alu_src = 0;
        case(opcode)
            7'b0110011: reg_write = 1; // R-type
            7'b0010011: begin reg_write = 1; alu_src = 1; end // I-type
        endcase
    end
endmodule
