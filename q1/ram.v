`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 09:44:48 PM
// Design Name: 
// Module Name: ram
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


module ram (
    input clk,                  
    input [7:0] dIn,           
    input [2:0] adr,       
    input writeEn,              
    output reg [7:0] dOut      
);

    reg [7:0] mem [0:7];        

    always @(posedge clk) begin
        if (writeEn) begin
         
            mem[adr] <= dIn;
        end else begin
           
            dOut <= mem[adr];
        end
    end

endmodule