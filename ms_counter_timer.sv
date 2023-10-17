`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2023 03:34:15 PM
// Design Name: 
// Module Name: ms_counter_timer
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


module ms_counter_timer #(parameter N=20) (
    input logic clk,
    input logic rst,
    input logic up,
    input logic delay,
    input logic en,
    output logic tic,
    output logic count
    );
    
    
    parameter ZERO={N,{1'b0}};
    logic [N-1:0] counter, n_counter;
    
    always_ff @(posedge clk, posedge rst)
    if (rst)
        begin
        counter<=ZERO;
        end
    else 
        counter<=n_counter;
    
    always_comb
        if(en)
        begin
            if(counter == delay * 17'd100000)
                n_counter = 0;
            else if(up)
                n_counter = counter + 1;
            else
                n_counter = counter - 1;
        end
        else
            n_counter = counter;
    assign count = counter;
    assign tic=counter==delay * 17'd100000;
    
    
endmodule
