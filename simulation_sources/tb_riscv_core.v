`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2026 13:18:30
// Design Name: 
// Module Name: tb_riscv_core
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


`timescale 1ns / 1ps

module tb_riscv_core();
    reg clk, reset;
    wire [31:0] pc, instr, alu_result;

    // Connect CPU and Memory
    riscv_mini_core cpu (.clk(clk), .reset(reset), .pc(pc), .instr(instr), .alu_result(alu_result));
    instruction_mem mem (.addr(pc), .instr(instr));

    always #5 clk = ~clk; // 100MHz clock simulation

    initial begin
        clk = 0; reset = 1;
        #20 reset = 0;

        // Force initial values for the registers
        cpu.reg_file[1] = 32'd5;   // Register x1 = 5
        cpu.reg_file[2] = 32'd10;  // Register x2 = 10

        #10; // Execution of ADD
        $display("Time: %t | PC: %h | ALU: %d (Expected 15) ", $time, pc, alu_result);
        
        #10; // Execution of AND
        $display("Time: %t | PC: %h | ALU: %d ", $time, pc, alu_result);

        #50 $finish;
    end
endmodule
