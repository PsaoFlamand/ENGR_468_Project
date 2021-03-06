module Test_LSL;	//[N, Z, C, V}]
reg [31:0] In1;
reg signed [3:0] In2;
reg S;
reg [3:0] Flag;
wire [31:0] Result;
wire [3:0] New_Flag;

initial
begin

In1=3; In2=1; Flag=4'b0000; S=1; 
#10 In1=6; In2=2; S=0; 
#10 In1=-6; In2=4; S=0;
#10 In1=32'b11111111111111111111111111111111; In2=9; S=1;
#10 In1=10; In2=13; S=1;
#10 In1=32'b01101111111111010111100011111111; In2=2; S=1;
end
initial
begin
$monitor($time, " In1.=%b, In2.=%b, Result=%b, Flag=%b, S=%b", In1, In2, Result, New_Flag, S);
end
LSL #(4) lsl(In1, In2, Result,Flag,S,New_Flag);

endmodule

//ADD add(In1, In2, Result,Flag,S,New_Flag);