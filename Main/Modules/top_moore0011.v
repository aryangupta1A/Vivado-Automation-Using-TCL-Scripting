`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 18:27:12
// Design Name: 
// Module Name: moore0011
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


module top_moore0011(clk, reset, w, z);
  input clk, reset, w;    // w is the input and we are assumind active low reset
  output reg z;           // z is the output
  reg [2:0] y, Y;         // Y is a next state variable, y is a present state variable
  parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
  
  always @(w, y)         // Defining next sate logic
    begin
      case(y)
        A: begin
          if(w==1)
            Y = A;
          else
            Y = B;
        end
        
        B: begin
          if(w==1)
            Y = A;
          else
            Y = C;
        end
        
        C:begin
          if(w==1)
            Y = D;
          else
            Y = C;
        end
        
        D:begin
          if(w==1)
            Y = E;
          else
            Y = B;
        end
        
        E:begin
          if(w==1)
            Y = A;
          else
            Y = B;
        end
        
        default: Y = 3'bxxx;
      endcase
    end
  
  
  always @(posedge clk, negedge reset)  // defining present state logic
    begin
      if(!reset)
        y <= A;
      else
        y <= Y;
    end
  
  always @(y)              //  defining output logic
    begin
      if(y==E)
        z=1;
      else
        z=0;
    end
  
endmodule
