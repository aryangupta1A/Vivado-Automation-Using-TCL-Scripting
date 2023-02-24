`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 17:58:35
// Design Name: 
// Module Name: top_mealy
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

module top_mealy(w,clk,reset,out,clk_slow);
input w,clk,reset; // w is serial input given sampled at every clock edge
output out;
output clk_slow;
clock_divider c0(clk,clk_slow);
mealy0011 t0(clk_slow,reset,w,out);
endmodule