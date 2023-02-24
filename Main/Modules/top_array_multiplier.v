`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 15:42:03
// Design Name: 
// Module Name: array_multiplier
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
// Reference: https://alljobs.co.in/study-material/4x4-array-multiplier-verilog-code/
//////////////////////////////////////////////////////////////////////////////////

module top_array_multiplier(product,A,B);
output [7:0]product;
input [3:0]A;
input [3:0]B;
assign product[0]=(A[0]&B[0]);
wire x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17;
HA HA1(product[1],x1,(A[1]&B[0]),(A[0]&B[1]));
FA FA1(x2,x3,A[1]&B[1],(A[0]&B[2]),x1);
FA FA2(x4,x5,(A[1]&B[2]),(A[0]&B[3]),x3);
HA HA2(x6,x7,(A[1]&B[3]),x5);
HA HA3(product[2],x15,x2,(A[2]&B[0]));
FA FA5(x14,x16,x4,(A[2]&B[1]),x15);
FA FA4(x13,x17,x6,(A[2]&B[2]),x16);
FA FA3(x9,x8,x7,(A[2]&B[3]),x17);
HA HA4(product[3],x12,x14,(A[3]&B[0]));
FA FA8(product[4],x11,x13,(A[3]&B[1]),x12);
FA FA7(product[5],x10,x9,(A[3]&B[2]),x11);
FA FA6(product[6],product[7],x8,(A[3]&B[3]),x10);
endmodule
