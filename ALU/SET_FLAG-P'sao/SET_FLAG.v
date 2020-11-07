module SET_FLAG(In1, In2, Result, Flag, S, New_Flag, Carry);	//[N, Z, C, V}]
input [31:0] In1, In2;
input S;
input [3:0] Flag;
input Carry;
input [31:0] Result;
output [3:0] New_Flag;

//Flag assignments
assign New_Flag[0]= (S) ? ((In1[31]==0 && In2[31]==0 && Result[31]==1)||(In1[31]==1 && In2[31]==1 && Result[31]==0) ? 1 : 0) : (Flag[0]);//What about for subtraction?
assign New_Flag[1]= (S) ? (Carry) : (Flag[1]);
assign New_Flag[2]= (S) ? ((Result==0)? 1 : 0) : (Flag[2]);
assign New_Flag[3]= (S) ? ((Result[31]==1)? 1 : 0) : (Flag[3]);

endmodule
