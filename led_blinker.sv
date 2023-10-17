`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2023 10:14:45 PM
// Design Name: 
// Module Name: jar_led_blinker
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


module led_blinker(
    //input [3:0] led_in,
    //input [15:0] led_delay,
    //input set_delay,
    input logic rst,
    input logic clk,
    
    // slot interface
    input  logic cs,
    input  logic read,
    input  logic write,
    input  logic [4:0] addr,
    input  logic [31:0] wr_data,
    output logic [31:0] rd_data
    );
    
    logic led_0, led_1, led_2, led_3;
    
    always_ff @(posedge(clk))
    begin
    if (led_0)
        rd_data[0] <= ~rd_data[0];
    if (led_1)
        rd_data[1] <= ~rd_data[1];
    if (led_2)
        rd_data[2] <= ~rd_data[2];
    if (led_3)
        rd_data[3] <= ~rd_data[3];
    end
        
    
    
    led_blinker_individual led0_blinker(
    .led_in(wr_data[17]),
    .led_delay(wr_delay[15:0]),
    .set_delay(wr_delay[16]),
    .rst(rst),
    .clk(clk),
    .led_out(led_0)
    );
    
    led_blinker_individual led1_blinker(
    .led_in(wr_data[18]),
    .led_delay(wr_delay[15:0]),
    .set_delay(wr_delay[16]),
    .rst(rst),
    .clk(clk),
    .led_out(led_1)
    );
    
    led_blinker_individual led2_blinker(
    .led_in(wr_data[19]),
    .led_delay(wr_delay[15:0]),
    .set_delay(wr_delay[16]),
    .rst(rst),
    .clk(clk),
    .led_out(led_2)
    );
    
    led_blinker_individual led3_blinker(
    .led_in(wr_data[20]),
    .led_delay(wr_delay[15:0]),
    .set_delay(wr_delay[16]),
    .rst(rst),
    .clk(clk),
    .led_out(led_3)
    );
    
endmodule
