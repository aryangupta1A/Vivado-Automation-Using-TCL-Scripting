`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2023 17:46:52
// Design Name: 
// Module Name: full_adder
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

module top_full_adder(a,b,cin,sum,cout);
  input a,b,cin;
  output sum,cout;
  wire x,y,z;
  half_adder h1(a, b, x, y);
  half_adder h2(x, cin, sum, z);
  or o1(cout,y,z);
endmodule
