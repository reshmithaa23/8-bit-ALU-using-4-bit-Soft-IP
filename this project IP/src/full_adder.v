`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2026 19:46:47
// Design Name: 
// Module Name: full_adder
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

module full_adder(
    input A,
    input B,
    input Cin,
    output SUM,
    output Cout
);

    wire S1;
    wire C1;
    wire C2;

    half_adder HA1 (
        .A(A),
        .B(B),
        .SUM(S1),
        .CARRY(C1)
    );

    half_adder HA2 (
        .A(S1),
        .B(Cin),
        .SUM(SUM),
        .CARRY(C2)
    );

    or (Cout, C1, C2);

endmodule