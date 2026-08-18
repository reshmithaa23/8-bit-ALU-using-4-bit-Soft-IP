`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2026 20:50:38
// Design Name: 
// Module Name: divider
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

module divider(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] QUOTIENT,
    output [3:0] REMAINDER,
    output       DIV_BY_ZERO
);

    assign DIV_BY_ZERO = (B == 4'b0000);

    assign QUOTIENT  = (B == 4'b0000) ? 4'b0000 : A / B;
    assign REMAINDER = (B == 4'b0000) ? 4'b0000 : A % B;

endmodule