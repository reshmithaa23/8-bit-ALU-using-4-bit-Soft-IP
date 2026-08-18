`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2026 19:54:43
// Design Name: 
// Module Name: ripple_carry_adder
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

module ripple_carry_adder(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] SUM,
    output       Cout
);

    wire C1, C2, C3;

    full_adder FA0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .SUM(SUM[0]),
        .Cout(C1)
    );

    full_adder FA1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C1),
        .SUM(SUM[1]),
        .Cout(C2)
    );

    full_adder FA2 (
        .A(A[2]),
        .B(B[2]),
        .Cin(C2),
        .SUM(SUM[2]),
        .Cout(C3)
    );

    full_adder FA3 (
        .A(A[3]),
        .B(B[3]),
        .Cin(C3),
        .SUM(SUM[3]),
        .Cout(Cout)
    );

endmodule