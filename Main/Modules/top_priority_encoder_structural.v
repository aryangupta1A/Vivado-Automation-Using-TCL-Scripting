`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 22:14:05
// Design Name: 
// Module Name: priority_encoder_structural
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
// https://www.youtube.com/watch?v=gnoqn705LBg
//////////////////////////////////////////////////////////////////////////////////


module top_priority_encoder_structural( input [7:0] D, output [2:0]Y );
wire x1, x2, x3, x4, x5, x6, x7;

or G0 (Y[2], D[7], D[7], D[5], D[4]);

or G1 (x1, D[2], D[3]);
and G2 (x2, ~D[5], ~D[4]);
and G3 (x3, x1, x2);
or G4 (Y[1], D[7], D[6], x3);

and G5 (x4, ~D[4], ~D[3], ~D[2], D[1]);
and G6 (x5, ~D[4], D[3]);
or G7 (x6, D[5], x4, x5);
and G8 (x7, ~D[6], x6);
or G9 (Y[0], D[7], x7);

endmodule
