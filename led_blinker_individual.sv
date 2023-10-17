`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2023 10:26:36 PM
// Design Name: 
// Module Name: led_blinker_individual
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


module led_blinker_individual(
    input logic led_in,
    input logic [15:0] led_delay,
    input logic set_delay,
    input logic rst,
    input logic clk,
    output logic led_out
    );
    
    logic [15:0] reg_out;
    
    always_ff @(posedge(clk), posedge(rst))
    if(rst)
        reg_out <= 16'b0;
    else
        if(set_delay)
            reg_out <= led_delay;
            
    ms_counter_timer #(.N(64)) ms_counter(
        .clk(clk),
        .rst(rst),
        .up(1'b1),
        .delay(reg_out),
        .en(led_in),
        .tic(led_out)
    );
    
    
    
    
    
endmodule
