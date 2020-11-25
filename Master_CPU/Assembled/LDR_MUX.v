module LDR_MUX (out, in0, in1, sel);

input sel;
input [31:0] in0,in1;
output reg [31:0] out;


always @*
begin 

if (sel)
	out =in1;
else 
	out=in0;	
end 

endmodule 

