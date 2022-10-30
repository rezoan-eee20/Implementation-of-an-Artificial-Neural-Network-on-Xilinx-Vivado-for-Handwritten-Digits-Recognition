`timescale 1ns / 1ps


module acc(
    input [19:0] acc_in,
    input [7:0] bias,
    input clk,
    input reset, 
    output [21:0] acc_out //12 fractional bits, 9 integer bits and 1 sign bit
    );
    
    reg [21:0] accum_Reg, mux_output;
    reg [21:0] acc_out;//dout
    
    wire sel, en; 
    wire [21:0] bias_extended, sum;
    
    adder_22_bit acc_adder(acc_in, mux_output, sum);
    acc_FSM acc_control(clk, reset, sel, en); 
    
    assign bias_extended = {{14{bias[7]}},bias};      //sign extension
    
    always @(posedge clk) begin
     if(en)
      acc_out <= sum;
    end 
    
    always @(posedge clk)
     accum_Reg <= sum; 
     
    always @(*) begin 
     if(sel)
      mux_output = bias_extended; 
     else
      mux_output = accum_Reg; 
    end
    
endmodule
