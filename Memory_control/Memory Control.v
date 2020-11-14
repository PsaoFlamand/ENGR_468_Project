// master code of memory control module 
module memory_control (op_code, SR1, SR2, STR, LDR, RW, data_reg, add_bus, data_bus,pc);
// pc instruction access, part of memory control 
//8 bit counter 
input [3:0] op_code;
input[31:0] SR1, SR2,pc;
output reg LDR,STR, RW;
output reg [31:0] data_reg, add_bus, data_bus;


always @*

begin 
if(op_code==4'b1101)   //LDR
begin
LDR=1;
RW=1;
Address_bus;
LDR_mux;
end

else if (op_code==4'b1110)//STR
begin

STR=1;
RW=0;
Address_bus;
end 

else 
PC_access;
end 
//LDR_mux(LDR, address,
endmodule 
