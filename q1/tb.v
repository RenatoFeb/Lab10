`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 09:46:32 PM
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
    reg clk;                     // Clock signal
    reg [7:0] dIn;               // 8-bit data input
    reg [2:0] adr;               // 3-bit address input
    reg writeEn;                 // Write enable signal
    wire [7:0] dOut;             // 8-bit data output

    // Instantiate the RAM module
    ram uut (
        .clk(clk),
        .dIn(dIn),
        .adr(adr),
        .writeEn(writeEn),
        .dOut(dOut)
    );

    // Clock generation: 10 time units for a full period (5 units high, 5 units low)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Test procedure
    initial begin
        // Write data to all addresses
        writeEn = 1;         // Enable write
        adr = 3'b000; dIn = 8'b00000001; #10; // Write 1 to address 0
        adr = 3'b001; dIn = 8'b00000010; #10; // Write 2 to address 1
        adr = 3'b010; dIn = 8'b00000011; #10; // Write 3 to address 2
        adr = 3'b011; dIn = 8'b00000100; #10; // Write 4 to address 3
        adr = 3'b100; dIn = 8'b00000101; #10; // Write 5 to address 4
        adr = 3'b101; dIn = 8'b00000110; #10; // Write 6 to address 5
        adr = 3'b110; dIn = 8'b00000111; #10; // Write 7 to address 6
        adr = 3'b111; dIn = 8'b00001000; #10; // Write 8 to address 7

        // Read data from all addresses
        writeEn = 0;         // Disable write
        adr = 3'b000; #10;   // Read from address 0
        adr = 3'b001; #10;   // Read from address 1
        adr = 3'b010; #10;   // Read from address 2
        adr = 3'b011; #10;   // Read from address 3
        adr = 3'b100; #10;   // Read from address 4
        adr = 3'b101; #10;   // Read from address 5
        adr = 3'b110; #10;   // Read from address 6
        adr = 3'b111; #10;   // Read from address 7

        // Hold simulation for observation
        #10;
        $stop;
    end

endmodule
