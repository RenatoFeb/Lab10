`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 10:13:10 PM
// Design Name: 
// Module Name: topmod
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


module topmod (
    input clk,          
    input reset,        
    output [7:0] result, 
    output done         
);


 
    wire [3:0] rom_data1, rom_data2; 
    wire [3:0] rf_outA, rf_outB;     
    wire [7:0] product;            
    wire w_rf, w_ram, DA, SA, SB;     
    wire [2:0] cu_state;             
    wire [2:0] rom_addr1, rom_addr2; 
    wire [2:0] ram_addr;              
    wire ram_out_valid;             

 
    cu ControlUnit (
        .clk(clk),
        .reset(reset),
        .adr1(rom_addr1),   
        .adr2(rom_addr2),    
        .w_rf(w_rf),       
        .adr(ram_addr),      
        .DA(DA),
        .SA(SA),
        .SB(SB),
        .st_out(cu_state),   
        .done(done),        
        .w_ram(w_ram)        
    );

    ROM MemoryROM1 ( 
        .adr(rom_addr1),     
        .data(rom_data1)    
    );

    
    ROM MemoryROM2 (
        .adr(rom_addr2),     
        .data(rom_data2)    
    );

 
    RF RegisterFile (
        .A(rf_outA),         
        .B(rf_outB),         
        .SA(SA),            
        .SB(SB),             
        .D(rom_data1),       
        .DA(DA),            
        .W(w_rf),           
        .rst(reset),        
        .clk(clk)           
    );

    CombMultiplier Multiplier (
        .in1(rf_outA),      
        .in2(rf_outB),       
        .product(product)    
    );

    RAM MemoryRAM (
        .clk(clk),         
        .dIn(product),      
        .adr(ram_addr),     
        .writeEn(w_ram),     
        .dOut(result)     
    );

endmodule
