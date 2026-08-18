`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2026 20:46:03
// Design Name: 
// Module Name: multiplier
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

module multiplier(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] PRODUCT
);

    wire [3:0] P0, P1, P2, P3;
    wire [7:0] S1, S2, S3;

    // Partial products
    and (P0[0], A[0], B[0]);
    and (P0[1], A[1], B[0]);
    and (P0[2], A[2], B[0]);
    and (P0[3], A[3], B[0]);

    and (P1[0], A[0], B[1]);
    and (P1[1], A[1], B[1]);
    and (P1[2], A[2], B[1]);
    and (P1[3], A[3], B[1]);

    and (P2[0], A[0], B[2]);
    and (P2[1], A[1], B[2]);
    and (P2[2], A[2], B[2]);
    and (P2[3], A[3], B[2]);

    and (P3[0], A[0], B[3]);
    and (P3[1], A[1], B[3]);
    and (P3[2], A[2], B[3]);
    and (P3[3], A[3], B[3]);

    // Addition of partial products
    assign S1 = {4'b0000, P0} +
                {3'b000, P1, 1'b0};

    assign S2 = S1 +
                {2'b00, P2, 2'b00};

    assign S3 = S2 +
                {1'b0, P3, 3'b000};

    assign PRODUCT = S3;

endmodule