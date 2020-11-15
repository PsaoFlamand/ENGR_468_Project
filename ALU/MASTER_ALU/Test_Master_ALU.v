module Test_MASTER_ALU;	//[N, Z, C, V}]
reg signed [31:0] Reg1, Reg2;
reg S;
reg [15:0] IV;
reg [3:0] OpCode;
reg [3:0] Flag;
reg [3:0] Cond;
wire signed [31:0] Result;
wire [3:0] New_Flag;

initial
begin

Reg1=32'b01100000000000000000000000000000; Reg2=32'b00100000000000000000000000000001; IV=0; OpCode=4'b0000; Cond=0; Flag=4'b0000; S=1; 
#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b0001; Cond=0; S=1; 
#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b0010; Cond=0; S=1;
#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b0011; Cond=0; S=1;
#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b0000; Cond=0; S=1;
#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b0000; Cond=0; S=1;
end
initial
begin
$monitor($time, " In1.=%d, In2.=%d, Result=%d, Flag=%b", Reg1, Reg2, Result, New_Flag);
end

MASTER_ALU master(Reg1, Reg2, IV, OpCode, Cond, S, Result, Flag, New_Flag);
endmodule
