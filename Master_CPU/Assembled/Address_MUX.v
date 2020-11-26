module Address_bus(out, in1, sel);

input sel;
input [31:0] in1;
output reg [31:0] out;


always @*
begin 

if (sel)
begin	
out =in1;
end 

else
	begin
	out=out+1'b1;
	end
		
end 

endmodule 
