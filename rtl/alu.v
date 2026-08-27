`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2026 13:16:07
// Design Name: 
// Module Name: alu
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


module alu(
input [3:0]a,
input [3:0]b,
input [2:0]option,
output reg [3:0]ans);
always @(*) begin
case(option)
3'b000:ans=a+b;
3'b001:ans=a-b;
3'b010:ans=a&b;
3'b011:ans=a|b;
3'b100:ans=a^b;
3'b101:ans=~a;
default:ans=4'b0000;
endcase
end
endmodule
