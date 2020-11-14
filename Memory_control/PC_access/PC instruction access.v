// pc instruction access, part of memory control 
//8 bit counter 

module PC_access (Clk, Reset, pc);
input Clk, Reset;
output reg[7:0] pc;
always @(posedge Clk)
if (! Reset)
pc=8'b00000000;
else
pc = pc+1;
endmodule