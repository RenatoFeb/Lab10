`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 10:15:55 PM
// Design Name: 
// Module Name: CombMultiplier
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


module CombMultiplier (
    input [3:0] in1,     // First operand (4 bits)
    input [3:0] in2,     // Second operand (4 bits)
    output [7:0] product // 8-bit product
);
    assign product = in1 * in2; // Simple combinational multiplication
endmodule