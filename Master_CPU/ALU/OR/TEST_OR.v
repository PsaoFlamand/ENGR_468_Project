module TEST_OR;	//[N, Z, C, V}]
reg signed [31:0] In1, In2;
reg S;
reg [3:0] Flag;
wire signed [31:0] Result;
wire [3:0] New_Flag;

initial
begin

In1=2; In2=3; Flag=4'b0000; S=1; 
#10 In1=1; In2=-3; S=1; 
#10 In1=-6; In2=-2; S=1;
#10 In1=32'b11111111111111111111111111111111; In2=9; S=1;
#10 In1=32'b10101010101010101010101010101010; In2=32'b00000000111111111100000000000000; S=1;
#10 In1=45; In2=-45; S=1;
end
initial
begin
$monitor($time, " In1.=%b, In2.=%b, Result=%b, Flag=%b", In1, In2, Result, New_Flag);
end
OR or1(In1, In2, Result, Flag, S, New_Flag);

endmodule
