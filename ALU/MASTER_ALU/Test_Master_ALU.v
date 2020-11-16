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
Reg1=0; Reg2=0; IV=0; OpCode=4'b1111; Cond=4'b0000; Flag=4'b0000;  S=1; //1111 NOP
#10 Reg1=32'b01100000000000000000000000000000; Reg2=32'b00100000000000000000000000000001; IV=0; OpCode=4'b0000; Cond=4'b0000; Flag=4'b0000;  S=1; //0000 ADD
#10 Reg1=32'b10011111111111111111111111111111; Reg2=32'b110000000000000000000000000001; IV=0; OpCode=4'b0001; Cond=4'b0000; S=1;		// 0001 SUB
#10 Reg1=7; Reg2=7; IV=0; OpCode=4'b0010; Cond=4'b0001; S=1;		// 0010 MUL
#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b0011; Cond=4'b0010; S=1;		// 0011 OR
#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b0100; Cond=4'b0000; S=1;		// 0100 AND
#10 Reg1=5; Reg2=70; IV=0; OpCode=4'b0101; Cond=4'b0000; S=1;		// 0101 XOR
#10 Reg1=5; Reg2=7; IV=10; OpCode=4'b0110; Cond=4'b0000; S=1;		// 0110 MOVn
#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b0111; Cond=4'b0000; S=1;		// 0111 MOV
#10 Reg1=32'b01100000000000000000000000000001; Reg2=32'b01100000000000000000000000000001; IV=1'b1; OpCode=4'b1000; Cond=4'b0000; S=1;		// 1000 LSR
#10 Reg1=5; Reg2=7; IV=5; OpCode=4'b1001; Cond=4'b0000; S=1;		// 1001 LSL
#10 Reg1=5; Reg2=70; IV=4; OpCode=4'b1010; Cond=4'b0000; S=1; 		// 1010 ROR
#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b1011; Cond=4'b0000; S=1; 		// 1011 CMP
//#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b1100; Cond=4'b0000; S=1;		// 1100 ADR
//#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b1101; Cond=4'b0000; S=1;		// 1101 LDR
//#10 Reg1=5; Reg2=7; IV=0; OpCode=4'b1110; Cond=4'b0000; S=1;		// 1110 STR
#10 Reg1=5; Reg2=70; IV=0; OpCode=4'b1111; Cond=4'b0000; S=1; 		// 1111 NOP
end
initial
begin
$monitor($time, " In1.=%d, In2.=%d, IV=%d Result=%d, Flag=%b, New_Flag=%b, OpCode=%b ", Reg1, Reg2, IV, Result, Flag, New_Flag,OpCode);
end

MASTER_ALU master(Reg1, Reg2, IV, OpCode, Cond, S, Result, Flag, New_Flag);
endmodule
