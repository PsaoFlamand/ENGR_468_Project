// LDR mux, part of memory control 
module LDR_mux(LDR, mux_out,data_ram,alu_result);
input LDR;
input [31:0]data_ram, alu_result;
output reg [31:0] mux_out;

always @*
begin 
if (LDR)
mux_out=data_ram;
else 
mux_out=alu_result;
end
endmodule 
