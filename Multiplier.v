`timescale 1ns / 1ps


module multiplier(
    input signed [7:0]a,
    input signed [7:0]b,
    output signed [15:0]p
    );
    
    assign p = a*b;
endmodule
