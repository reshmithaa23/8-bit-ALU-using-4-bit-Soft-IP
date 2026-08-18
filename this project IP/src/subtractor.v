`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2026 20:00:43
// Design Name: 
// Module Name: subtractor
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

module subtractor(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] DIFF,
    output       Borrow
);

    wire [3:0] B_inv;
    wire C1, C2, C3, Cout;

    xor (B_inv[0], B[0], 1'b1);
    xor (B_inv[1], B[1], 1'b1);
    xor (B_inv[2], B[2], 1'b1);
    xor (B_inv[3], B[3], 1'b1);

    full_adder FA0 (
        .A(A[0]), .B(B_inv[0]), .Cin(1'b1),
        .SUM(DIFF[0]), .Cout(C1)
    );

    full_adder FA1 (
        .A(A[1]), .B(B_inv[1]), .Cin(C1),
        .SUM(DIFF[1]), .Cout(C2)
    );

    full_adder FA2 (
        .A(A[2]), .B(B_inv[2]), .Cin(C2),
        .SUM(DIFF[2]), .Cout(C3)
    );

    full_adder FA3 (
        .A(A[3]), .B(B_inv[3]), .Cin(C3),
        .SUM(DIFF[3]), .Cout(Cout)
    );

    not (Borrow, Cout);

endmodule