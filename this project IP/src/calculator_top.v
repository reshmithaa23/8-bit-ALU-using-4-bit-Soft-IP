`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2026 11:22:06
// Design Name: 
// Module Name: calculator_top
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

module calculator_top(
    input  [3:0] A,
    input  [3:0] B,
    input  [1:0] OP,

    output [7:0] RESULT,
    output [3:0] REMAINDER,
    output       DIV_BY_ZERO
);

    wire [3:0] ADD_RESULT_4;
    wire       ADD_COUT;

    wire [3:0] SUB_RESULT_4;
    wire       SUB_BORROW;

    wire [7:0] MUL_RESULT;
    wire [3:0] DIV_QUOTIENT;

    wire [7:0] ADD_RESULT;
    wire [7:0] SUB_RESULT;
    wire [7:0] DIV_RESULT;

    // ADDITION
    ripple_carry_adder ADDER (
        .A(A),
        .B(B),
        .Cin(1'b0),
        .SUM(ADD_RESULT_4),
        .Cout(ADD_COUT)
    );

    assign ADD_RESULT = {ADD_COUT, ADD_RESULT_4};

    // SUBTRACTION
    subtractor SUBTRACTOR (
        .A(A),
        .B(B),
        .DIFF(SUB_RESULT_4),
        .Borrow(SUB_BORROW)
    );

    assign SUB_RESULT = {4'b0000, SUB_RESULT_4};

    // MULTIPLICATION
    multiplier MULTIPLIER (
        .A(A),
        .B(B),
        .PRODUCT(MUL_RESULT)
    );

    // DIVISION
    divider DIVIDER (
        .A(A),
        .B(B),
        .QUOTIENT(DIV_QUOTIENT),
        .REMAINDER(REMAINDER),
        .DIV_BY_ZERO(DIV_BY_ZERO)
    );

    assign DIV_RESULT = {4'b0000, DIV_QUOTIENT};

    // OPERATION SELECTION
    operation_mux MUX (
        .ADD_RESULT(ADD_RESULT),
        .SUB_RESULT(SUB_RESULT),
        .MUL_RESULT(MUL_RESULT),
        .DIV_RESULT(DIV_RESULT),
        .OP(OP),
        .RESULT(RESULT)
    );

endmodule