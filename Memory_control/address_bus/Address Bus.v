//address bus, part of memory control 

module Address_bus(SR1, pc, LDR, STR, add_bus);
input [31:0] SR1;
input LDR, STR;
input [7:0]pc;
output reg [31:0] add_bus;

always@*
begin
if(LDR==1|STR==1)
add_bus=SR1;
else 
add_bus=pc;
end 
endmodule 

