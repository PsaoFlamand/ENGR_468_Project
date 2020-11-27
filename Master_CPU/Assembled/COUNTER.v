module COUNTER(clk, reset, count,RW_ram,Enable);

input clk,reset;
output reg [31:0] count;
output reg RW_ram,Enable;



always @ (*)
begin
count = 32'b00000000000000000000000000000000;
if(!reset)
	count = 32'b00000000000000000000000000000000;
else
	count = count + 1;
	RW_ram=1'b1;
	Enable=1'b1;
end
endmodule