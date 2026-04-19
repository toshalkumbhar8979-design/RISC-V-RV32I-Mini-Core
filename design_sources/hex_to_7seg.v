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
    input clk,                  // 100MHz System Clock
    input [15:0] data,          // 16-bit input data (4 Hex digits)
    output reg [6:0] seg,       // 7-segment patterns {g, f, e, d, c, b, a}
    output reg [3:0] an         // Digit enable (Anodes)
    );

    // Refresh counter to cycle through the 4 digits (~1kHz refresh rate)
    reg [19:0] refresh_counter; 
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
    end

    // Use the upper 2 bits of the counter to select the active digit
    wire [1:0] active_digit = refresh_counter[19:18]; 
    reg [3:0] hex_digit;

    // Digit Multiplexer: Selects which hex nibble to decode and activates corresponding Anode
    always @(*) begin
        case(active_digit)
            2'b00: begin 
                an = 4'b1110;           // Activate Digit 0 (Rightmost)
                hex_digit = data[3:0]; 
            end
            2'b01: begin 
                an = 4'b1101;           // Activate Digit 1
                hex_digit = data[7:4]; 
            end
            2'b10: begin 
                an = 4'b1011;           // Activate Digit 2
                hex_digit = data[11:8]; 
            end
            2'b11: begin 
                an = 4'b0111;           // Activate Digit 3 (Leftmost)
                hex_digit = data[15:12]; 
            end
            default: begin 
                an = 4'b1111;           // All digits OFF
                hex_digit = 4'h0; 
            end
        endcase
    end

    // Hex to 7-Segment Decoder
    // Basys 3 is Common Anode: 0 is ON, 1 is OFF
    // Segment order: [6]=g, [5]=f, [4]=e, [3]=d, [2]=c, [1]=b, [0]=a
    always @(*) begin
        case(hex_digit)
            4'h0: seg = 7'b100_0000; // 0
            4'h1: seg = 7'b111_1001; // 1
            4'h2: seg = 7'b010_0100; // 2
            4'h3: seg = 7'b011_0000; // 3
            4'h4: seg = 7'b001_1001; // 4
            4'h5: seg = 7'b001_0010; // 5
            4'h6: seg = 7'b000_0010; // 6
            4'h7: seg = 7'b111_1000; // 7
            4'h8: seg = 7'b000_0000; // 8
            4'h9: seg = 7'b001_0000; // 9
            4'hA: seg = 7'b000_1000; // A
            4'hB: seg = 7'b000_0011; // b
            4'hC: seg = 7'b100_0110; // C
            4'hD: seg = 7'b010_0001; // d
            4'hE: seg = 7'b000_0110; // E
            4'hF: seg = 7'b000_1110; // F
            default: seg = 7'b111_1111; // OFF
        endcase
    end

endmodule
