module Address_bus(out, in1, sel, Reset);

input sel, Reset;
input [31:0] in1;
output reg [31:0] out;
reg [7:0]pc;

always @*
begin 

if (sel)
	begin	
	pc=0;
	out =in1;
	end 

else
	begin
	pc=pc+1'b1;
	out=pc;
	end
		
end 

endmodule 

