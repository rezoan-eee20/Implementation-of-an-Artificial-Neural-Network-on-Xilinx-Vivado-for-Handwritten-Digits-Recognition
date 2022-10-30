`timescale 1ns / 1ps

module mac_acc(
    input clk,
    input reset,
    input [7:0] bias,
    input [127:0] pixels,
    input [127:0] weights,
    
    output [7:0] sigmoid_out
    );
    
    wire [19:0] mac_out;
    wire [21:0] acc_out;
     
    
    mac mc(clk, pixels, weights, mac_out);
    acc ac(mac_out, bias, clk, reset, acc_out);
    IPwrapper wrap(acc_out, sigmoid_out);
endmodule

