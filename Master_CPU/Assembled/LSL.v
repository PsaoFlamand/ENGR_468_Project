module LSL(In1, In2, Result,Flag,S,New_Flag);	//[N, Z, C, V}]
parameter n = 5;
input [31:0] In1;
input [n-1:0] In2;
input S;
input [3:0] Flag;

output [31:0] Result;
output [3:0] New_Flag;
wire Carry;
wire addsub=1'b1;
assign Result = In1<<In2;
assign Carry=In1[32-In2];



//Flag assignments
SET_FLAG set(In1, In2, Result,Flag,S,New_Flag,Carry,addsub);

endmodule
