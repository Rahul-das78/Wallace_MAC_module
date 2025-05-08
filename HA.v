`timescale 1ns / 1ps


module HA(Sum, Cout, A, B);

    input A, B;
    output Sum, Cout;
    
    xor x1(Sum,A,B);
    and a1(Cout,A,B);


endmodule
