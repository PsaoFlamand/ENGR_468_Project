module SUB(In1, In2, Result, Flag, S, New_Flag);

input signed [31:0] In1, In2;
input [3:0] Flag;
input S;
output signed [31:0] Result;
output [3:0] New_Flag;
wire Carry;

assign {Carry, Result} = In1 - In2;
//assign Result = (In1[31]) ? ~In1 + 1b'1 + In2 : (In2[31]) ? In1 + ~In2 + 1b'1 : 0;
//assign Result = (In1[31]) ? ~In1 + 1b'1 : (In2[31]) ? ~In2 + 1b'1;

SET_FLAG set(In1, In2, Result, Flag, S, New_Flag, Carry);

endmodule