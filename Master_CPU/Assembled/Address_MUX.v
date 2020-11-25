module Address_bus(out, in1, sel, Reset);

input sel, Reset;
input [31:0] in1;
output reg [31:0] out;


always @*
begin 

if (sel)
begin	
out =in1;
end 
/*else if (! Reset)
	begin 
	out=8'b00000000;
	end*/
else
	begin
	out=out+1'b1;
	end
		
end 

endmodule 


