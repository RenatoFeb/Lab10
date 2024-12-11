`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 10:20:22 PM
// Design Name: 
// Module Name: tb
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


module tb;

    reg clk;                   
    reg reset;               
    wire [7:0] result;      

  
    topmod uut (
        .clk(clk),
        .reset(reset),
        .result(result)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

 
    initial begin
       
        reset = 1; 
        #15;       

        reset = 0;  

       
        #200;

   
        $stop;
    end

endmodule
