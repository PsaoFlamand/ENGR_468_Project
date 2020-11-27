module Address_bus(out, in1, sel, Reset);

input sel,Reset;
input [31:0] in1;
output reg [31:0] out;

always @*
begin 

if (sel==1'b1)
out =in1;
else if (sel==1'b1 && Reset==1'b0)
	out=0;
else 
	out=out+1'b1;		
end 

endmodule 

