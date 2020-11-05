module OR(In1, In2, Result, Flag, S, New_Flag);

input signed [31:0] In1,In2;
input [3:0] Flag;
input S;
output signed [31:0] Result;
output New_Flag;
wire Carry;

assign {Carry, Result} = In1 | In2;

SET_FLAG set(In1, In2, Result, Flag, S, New_Flag, Carry);

endmodule