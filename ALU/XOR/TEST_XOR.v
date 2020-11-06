module TEST_XOR;	//[N, Z, C, V}]
reg signed [31:0] In1, In2;
reg S;
reg [3:0] Flag;
wire signed [31:0] Result;
wire [3:0] New_Flag;

initial
begin

In1=2; In2=3; Flag=4'b0000; S=1; 
#10 In1=32'b11110000111100001111000011110000; In2= 32'b11111111000000001111111100000000; S=1; 
#10 In1=-6; In2=-2; S=1;
#10 In1=32'b11111111111111111111111111111111; In2=9; S=1;
#10 In1=1000000; In2=2147483647; S=1;
#10 In1=4; In2=-4; S=1;
end
initial
begin
$monitor($time, " In1.=%b, In2.=%b, Result=%b, Flag=%b", In1, In2, Result, New_Flag);
end
XOR xor1(In1, In2, Result,Flag,S,New_Flag);

endmodule
