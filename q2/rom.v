`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 09:51:11 PM
// Design Name: 
// Module Name: rom
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


module rom (
    input [2:0] adr,      // 3-bit address (8 locations)
    output reg [3:0] data // 4-bit data output
);

    // ROM contents
    always @(*) begin
        case (adr)
            3'b000: data = 4'b0001; // Address 0 -> Data 1
            3'b001: data = 4'b0010; // Address 1 -> Data 2
            3'b010: data = 4'b0011; // Address 2 -> Data 3
            3'b011: data = 4'b0100; // Address 3 -> Data 4
            3'b100: data = 4'b0101; // Address 4 -> Data 5
            3'b101: data = 4'b0110; // Address 5 -> Data 6
            3'b110: data = 4'b0111; // Address 6 -> Data 7
            3'b111: data = 4'b1000; // Address 7 -> Data 8
            default: data = 4'b0000; // Default case (shouldn't occur)
        endcase
    end

endmodule
