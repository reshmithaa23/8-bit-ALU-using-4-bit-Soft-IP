`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2026 20:56:09
// Design Name: 
// Module Name: operation_mux
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

module operation_mux(
    input  [7:0] ADD_RESULT,
    input  [7:0] SUB_RESULT,
    input  [7:0] MUL_RESULT,
    input  [7:0] DIV_RESULT,

    input  [1:0] OP,

    output [7:0] RESULT
);

    // 4-to-1 multiplexer
    assign RESULT = (OP == 2'b00) ? ADD_RESULT :
                    (OP == 2'b01) ? SUB_RESULT :
                    (OP == 2'b10) ? MUL_RESULT :
                                    DIV_RESULT;

endmodule