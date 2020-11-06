module COUNTER(clk, reset, count);

input clk,reset;
output [7:0] count;

reg [7:0] count;

always @ (posedge clk)
if(!reset)
	count = 8'b00000000;
else
	count = count + 4;

endmodule