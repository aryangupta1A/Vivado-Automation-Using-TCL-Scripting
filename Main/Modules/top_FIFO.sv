`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2023 22:26:48
// Design Name: 
// Module Name: FIFO
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

module top_FIFO(w_en,r_en,din,rst,clk,full,empty,half_full,dout,counter,write_pointer, read_pointer );
input logic w_en,r_en,clk,rst;
parameter N=16;
parameter M=32;
input logic [N-1:0] din;
output logic [N-1:0] dout;
output logic full,empty,half_full;
bit [M-1:0]mem[N-1:0]; // declaring an unpacked 2D array 
output logic [4:0] write_pointer;
output logic [4:0] read_pointer;
output logic [5:0] counter;


assign full=(counter==6'b100000);
assign empty=(counter==6'b000000);
assign half_full=(counter==6'b010000);

always_ff @(posedge clk)
begin

priority if(!rst)  //active low reset
    begin
    counter<=6'b0;
    write_pointer<=5'b0;
    read_pointer<=5'b0;
    end

    else if ((!r_en)&(!w_en))
    begin
    counter<=counter; //when both read and write enable signals are inactive, counter remains the same
    end

    else if(6'b000000<counter && counter<6'b100000)
    begin
    
        if(r_en)
        begin
        counter<=counter-6'b000001; //decrementing counter
        dout<=mem[read_pointer]; //reading from memory
        read_pointer<=read_pointer+5'b00001; //incrementing read pointer
        end
    
        if(w_en)
        begin
        counter<=counter+6'b000001; //incrementing counter
        mem[write_pointer]<=din; //writing to memory
        write_pointer<=write_pointer+5'b00001; //incrementing write pointer
        end
    end
    


    else if(counter==6'b100000)
    begin
        assert (!w_en) //assert statement if write enable is active and counter is at maximum
        begin
        if(r_en) begin
            counter<=counter-6'b00001;
            dout<=mem[read_pointer];
            read_pointer<=read_pointer+5'b00001;
            end 
        end
        else $error("Can't write, memory is full"); // we also see that this error is printed below in the Vivado Log when assert statement fails
    end
    
    else if(counter==6'b0)
    begin
        assert (!r_en)  begin
        if(w_en) begin
            counter<=counter+6'b000001;
            mem[write_pointer]<=din;
            write_pointer<=write_pointer+5'b00001;
            end 
        end
        else $error("Can't read, memory is empty");
    end
    
    end
endmodule
