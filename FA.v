`timescale 1ns / 1ps

module FA(Sum, Cout, A, B, Cin);
    
    input A, B, Cin;
    output Sum, Cout;
    
    xor x1(Sum,A,B,Cin);
    majority m1(Cout,A,B,Cin);
endmodule  


module majority(out,a,b,c);
    input a,b,c;
    output out;
    and (g, a, b);
    and (h, b, c);
    and (i, c, a);
    or #1 (out, g, h, i);
endmodule

