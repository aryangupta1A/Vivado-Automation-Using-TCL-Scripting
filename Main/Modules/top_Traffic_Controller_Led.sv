`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2023 12:35:37
// Design Name: 
// Module Name: Traffic_Controller_Led
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

module top_Traffic_Controller_Led(clk,reset,north_dir, south_dir, east_dir, west_dir);


input logic clk,reset; // input clock and reset signal
output logic [2:0] north_dir; // output for north direction
output logic [2:0] west_dir; // output for west direction
output logic [2:0] east_dir; // output for east direction
output logic [2:0] south_dir; // output for south direction
logic [3:0] time_counter; // variable to keep track of time

// enum type for states of traffic lights
typedef enum {north_green, north_yellow, south_green, south_yellow, east_green, east_yellow, west_green, west_yellow} state ;
state current_state;

// The always_ff block continuously runs and updates the state of the traffic lights based on the time counter and the current state.
always_ff @(posedge clk) begin
  if(!reset) begin
    current_state <= north_green; // initial state
    time_counter=4'b0; // reset time counter
  end else begin
    time_counter=time_counter+4'b0001; // increment time counter
    unique case(current_state)
      north_green: begin
        if(time_counter == 10) begin
          current_state = north_yellow; // change to north yellow state
          time_counter = 4'b0; // reset time counter
        end
      end
      north_yellow: begin
        if(time_counter == 5) begin
          current_state = south_green; // change to south green state
          time_counter = 4'b0; // reset time counter
        end
      end
      south_green: begin
        if(time_counter == 10) begin
          current_state = south_yellow; // change to south yellow state
          time_counter = 4'b0; // reset time counter
        end
      end
      south_yellow: begin
        if(time_counter == 5) begin
          current_state = east_green;
          time_counter = 4'b0;
        end
      end
      east_green: begin
        if(time_counter == 10) begin
          current_state = east_yellow;
          time_counter = 4'b0;
        end
      end
      east_yellow: begin
        if(time_counter == 5) begin
          current_state = west_green;
          time_counter = 4'b0;
        end
      end
      west_green: begin   
        if(time_counter == 10) begin
          current_state = west_yellow;
          time_counter = 4'b0;
        end
      end
      west_yellow: begin
        if(time_counter == 5) begin
          current_state = north_green;
          time_counter = 4'b0;
        end
      end
    endcase
  end
end

// assign output based on current state
// The outputs represent the state of the traffic light, 001 for green, 010 for yellow, and 100 for red.
assign north_dir=(current_state==north_green)?001:(current_state==north_yellow)?010:100;
assign south_dir=(current_state==south_green)?001:(current_state==south_yellow)?010:100;
assign east_dir=(current_state==east_green)?001:(current_state==east_yellow)?010:100;
assign west_dir=(current_state==west_green)?001:(current_state==west_yellow)?010:100;
endmodule