`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2026 13:16:29
// Design Name: 
// Module Name: alutb
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


module alutb();
reg [3:0]a;
reg [3:0]b;
reg [2:0]option;
wire [3:0]ans;
reg [3:0]res;
integer i;
integer j;
integer k;
integer error;
integer op_error;
integer pass_no;
alu uut(.a(a),.b(b),.option(option),.ans(ans));
initial begin
error=0;
pass_no=0;
for(k=0;k<6;k=k+1)begin
option=k;
op_error=error;
for(i=0;i<16;i=i+1)begin
    for(j=0;j<16;j=j+1)begin
  a=i;b=j;
  #10;
  case(option)
    3'b000:res=a+b;
    3'b001:res=a-b;
    3'b010:res=a&b;
    3'b011:res=a|b;
    3'b100:res=a^b;
    3'b101:res=~a;
    default:res=4'b0000;
    endcase
    if(ans!==res)begin
    $display("FAIL:A=%0d,B=%0d,OP=%0d",a,b,option);
    error =error+1;
    end  
    else
    pass_no=pass_no+1;
end
end
if(op_error==error)begin
    case(option)
    3'b000:$display("ADD:PASS");
    3'b001:$display("SUB:PASS");
    3'b010:$display("AND:PASS");
    3'b011:$display("OR:PASS");
    3'b100:$display("XOR:PASS");
    3'b101:$display("NOT:PASS");
    endcase
    end
if(op_error!==error)begin
    case(option)
    3'b000:$display("ADD:FAIL");
    3'b001:$display("SUB:FAIL");
    3'b010:$display("AND:FAIL");
    3'b011:$display("OR:FAIL");
    3'b100:$display("XOR:FAIL");
    3'b101:$display("NOT:FAIL");
    endcase
    end
end
 $display("--------------------------------");
$display("Total Tests:%0d",error+pass_no);
$display("Passed:%0d",pass_no);
$display("Failed:%0d",error);
 $display("--------------------------------");
if(error == 0)
$display("ALL TEST CASES PASSED");
else
$display("TEST COMPLETED WITH %0d ERRORS",error);
$finish;
end
endmodule
//run 100 us
