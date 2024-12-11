`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 09:51:40 PM
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

    // Testbench signals
    reg [2:0] adr;       // 3-bit address input
    wire [3:0] data;     // 4-bit data output

    // Instantiate the ROM module
    rom uut (
        .adr(adr),
        .data(data)
    );

    // Generate address stimulus
    initial begin
        // Start at address 0
        adr = 3'b000;

        // Iterate through all address values with 10-time-unit intervals
        #10 adr = 3'b001;
        #10 adr = 3'b010;
        #10 adr = 3'b011;
        #10 adr = 3'b100;
        #10 adr = 3'b101;
        #10 adr = 3'b110;
        #10 adr = 3'b111;

        // Hold the last address for observation
        #10;

        // End simulation
        $stop;
    end

endmodule
