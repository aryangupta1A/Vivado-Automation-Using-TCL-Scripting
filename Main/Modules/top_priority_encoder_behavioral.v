`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 19:35:54
// Design Name: 
// Module Name: priority_encoder_behavioral
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

module top_priority_encoder_behavioral(ip, Y, z);
  input [7:0]ip;
  output reg [2:0]Y;
  output reg z;        // z is a high impedance output
  
  always @(ip)         // when the value of ip changes, always block will be executed
    begin
      z =1;
      casex(ip)
//        8'b00000001 : Y = 3'b000;
//        8'b0000001x : Y = 3'b001;        
//        8'b000001xx : Y = 3'b010;
//        8'b00001xxx : Y = 3'b011;
//        8'b0001xxxx : Y = 3'b100;
//        8'b001xxxxx : Y = 3'b101;
//        8'b01xxxxxx : Y = 3'b110;
//        8'b1xxxxxxx : Y = 3'b111;
        
        8'b1xxxxxxx : Y = 3'b111;
        8'b01xxxxxx : Y = 3'b110;
        8'b001xxxxx : Y = 3'b101;
        8'b0001xxxx : Y = 3'b100;
        8'b00001xxx : Y = 3'b011;
        8'b000001xx : Y = 3'b010;
        8'b0000001x : Y = 3'b001;
        8'b00000001 : Y = 3'b000;
        default:
          begin
            z = 0;
            Y = 3'bxxx;     // default value of the output will be don't care
          end
      endcase
    end
endmodule

