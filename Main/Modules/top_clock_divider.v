`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 17:57:18
// Design Name: 
// Module Name: clock_divider
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

module top_clock_divider(clk_in , led);
input clk_in;
output led;
reg [30:0] count = 0;
reg clk_out;  
always@(posedge clk_in)
begin
count = count +1 ;
if (count == 200000000 )
begin
count<=0;
clk_out = ~clk_out;
end
end
assign led = clk_out;       
endmodule