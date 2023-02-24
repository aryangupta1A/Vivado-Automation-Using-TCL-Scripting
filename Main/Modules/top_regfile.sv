`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2023 00:15:39
// Design Name: 
// Module Name: regfile
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

module top_regfile #(
  parameter M = 32, 
  parameter N = 32
) (
  input logic clk,
  input logic we,
  input logic [$clog2(M)-1:0] rw,
  input logic [$clog2(M)-1:0] r1,
  input logic [$clog2(M)-1:0] r2,
  input logic [N-1:0] din,
  output logic [N-1:0] dout1,
  output logic [N-1:0] dout2
);
  logic [N-1:0] memory[M-1:0];

  always_ff @(posedge clk) begin
    if (we) begin
    memory[rw] <= din; end // write operation
    // read operation occurs at every clock edge, there is no enable signal for read operation to occur is a register file
    dout1 <= memory[r1];
    dout2 <= memory[r2];
  end
endmodule
