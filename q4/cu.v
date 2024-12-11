`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 10:17:19 PM
// Design Name: 
// Module Name: cu
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


module cu (
    input clk, reset,
    input [2:0] adr1, adr2,
    output reg w_rf,
    output reg [2:0] adr,
    output reg DA, SA, SB,
    output reg [2:0] st_out,
    output reg done,
    output reg w_ram
);

    // State encoding
    parameter S0_idle = 0, 
              S1_send_adr1 = 1, 
              S2_send_adr2 = 2,
              S3_multiply = 3, 
              S4_write_ram = 4, 
              S5_read_ram = 5;

    reg [2:0] PS, NS;

    // State Register
    always @(posedge clk or posedge reset) begin
        if (reset)
            PS <= S0_idle;   
        else    
            PS <= NS;
    end  

    // Next State and Output Logic
    always @(*) begin
        // Default values to avoid latches
        NS = PS;
        w_rf = 0;
        w_ram = 0;
        adr = 3'b000;
        DA = 0;
        SA = 0;
        SB = 0;
        st_out = 3'b000;
        done = 0;

        case (PS)
            S0_idle: begin
                NS = S1_send_adr1;
                st_out = 3'b000;
            end

            S1_send_adr1: begin
                w_rf = 1;
                adr = adr1;
                SA = 0;
                SB = 1;
                st_out = 3'b001;
                NS = S2_send_adr2;
            end

            S2_send_adr2: begin
                w_rf = 1;
                adr = adr2;
                DA = 1;
                SA = 0;
                SB = 1;
                st_out = 3'b010;
                NS = S3_multiply;
            end

            S3_multiply: begin
                st_out = 3'b011;
                NS = S4_write_ram;
            end

            S4_write_ram: begin
                w_ram = 1;
                st_out = 3'b100;
                NS = S5_read_ram;
            end

            S5_read_ram: begin
                w_ram = 0;
                done = 1;
                st_out = 3'b101;
                NS = reset ? S0_idle : S5_read_ram;
            end
        endcase
    end

endmodule
