module LSR(In1, In2, Result,Flag,S,New_Flag);	//[N, Z, C, V}]
parameter n = 1;
input [31:0] In1;
input [n-1:0] In2;
input S;
input [3:0] Flag;

output [31:0] Result;
output [3:0] New_Flag;
wire Carry;
assign Result = In1>>In2;
assign Carry=Result[In2];

//Flag assignments
SET_FLAG set(In1, In2, Result,Flag,S,New_Flag,Carry);

endmodule
