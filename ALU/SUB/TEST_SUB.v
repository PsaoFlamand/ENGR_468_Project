module Test_SUB;	//[N, Z, C, V}]
reg signed [31:0] In1, In2;
reg S;
reg [3:0] Flag;
wire signed [31:0] Result;
wire [3:0] New_Flag;

initial
begin

In1=2; In2=3; Flag=4'b0000; S=1; 
#10 In1=1; In2=-3; S=1; 
#10 In1=-6; In2=8; S=1;
#10 In1=32'b11111111111111111111111111111111; In2=32'b11111111111111111111111111111111; S=1;
#10 In1=10; In2=10; S=1;
#10 In1=4; In2=-4; S=1;
end
initial
begin
$monitor($time, " In1.=%d, In2.=%d, Result=%d, Flag=%b", In1, In2, Result, New_Flag);
end
SUB sub(In1, In2, Result,Flag,S,New_Flag);

endmodule
