`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 17:59:32
// Design Name: 
// Module Name: mealy0011
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

module top_mealy0011 (clk, reset, w, z);
  input clk, reset, w;    // w is the input and we are assumind active low reset
  output reg z;           // z is the output
  reg [1:0] y, Y;         // Y is a next state variable, y is a present state variable
  parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
  
  always @(w, y)         // Defining next sate logic and output logic
    begin
      
      case(y)
        A: 
         begin
          if(w==1)
            begin
              Y <= A;
              z <=0;
            end
          else
            begin
              Y <= B;
              z <= 0;
            end
        end
        
        B: 
         begin
          if(w==1)
            begin
              Y <= A;
              z <= 0;
            end
          else
            begin
              Y <= C;
              z <= 0;
            end
        end
        
        C: 
         begin
          if(w==1)
            begin
              Y <= D;
              z <= 0;
            end
          else
            begin
              Y <= C;
              z <= 0;
            end
        end
        
        D: 
         begin
          if(w==1)
            begin
              Y <= A;
              z <= 1;
            end
          else
            begin
              Y <= B;
              z <= 0;
            end
        end
      endcase
    end
  
  always @(posedge clk, negedge reset)  // defining present state logic
    begin
      if(reset == 0)
        y <= A;
      else
        y <=Y;
    end
  
endmodule

