module OR(In1, In2, Result, Flag, S, New_Flag);

input signed [31:0] In1,In2;
input [3:0] Flag;
input S;
output signed [31:0] Result;
output [3:0] New_Flag;
wire Carry=1'b0;
wire addsub=1'b1;
assign Result = In1 | In2;

SET_FLAG set(In1, In2, Result, Flag, S, New_Flag, Carry,addsub);

endmodule