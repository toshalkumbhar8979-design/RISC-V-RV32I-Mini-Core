`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: hex_to_7seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//              
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////

module hex_to_7seg(
    input clk,
    input [31:0] hex_val,
    output reg [6:0] seg,
    output reg [3:0] an
);
    reg [1:0] led_sel;
    reg [19:0] count;
    reg [3:0] nibble;

    always @(posedge clk) count <= count + 1;

    always @(*) begin
        led_sel = count[19:18];
        case(led_sel)
            2'b00: begin an = 4'b1110; nibble = hex_val[3:0];   end
            2'b01: begin an = 4'b1101; nibble = hex_val[7:4];   end
            2'b10: begin an = 4'b1011; nibble = hex_val[11:8];  end
            2'b11: begin an = 4'b0111; nibble = hex_val[15:12]; end
        endcase
    end

    always @(*) begin
        case(nibble)
            4'h0: seg = 7'b1000000; 4'h1: seg = 7'b1111001;
            4'h2: seg = 7'b0100100; 4'h3: seg = 7'b0110000;
            4'h4: seg = 7'b0011001; 4'h5: seg = 7'b0010010;
            4'h6: seg = 7'b0000010; 4'h7: seg = 7'b1111000;
            4'h8: seg = 7'b0000000; 4'h9: seg = 7'b0010000;
            4'hA: seg = 7'b0001000; 4'hB: seg = 7'b0000011;
            4'hC: seg = 7'b1000110; 4'hD: seg = 7'b0100001;
            4'hE: seg = 7'b0000110; 4'hF: seg = 7'b0001110;
            default: seg = 7'b1111111;
        endcase
    end
endmodule
