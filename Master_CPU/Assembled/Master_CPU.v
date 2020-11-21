module MASTER_CPU(instruction, Clk);

input reg [31:0] instruction;
input Clk;

reg signed [31:0] Reg1, Reg2;
reg S;
reg [4:0] IV_ShftRor;
reg [2:0] IV_Bits;
reg [3:0] Source1,Source_2;
reg [3:0] OpCode;
reg [3:0] Flag;
reg [3:0] Cond;
reg  Enable,RW;

reg [15:0] Address;
wire [31:0] Out;  //Ram output


wire signed [31:0] Result;
wire [3:0] New_Flag;

//Register bank part and split the instruction part
wire de

assign Cond = instruction[31:28];
assign OpCode =  instruction[27:24];
assign s =  instruction[23];
assign destination = instruction[22:19];
assign source_2 = instruction[18:15];
assign source_1 = instruction[14:11];
assign immediate_value =  instruction[18:3];

RAM ram(Enable,RW,Address,In,Out);
Register_bank(destination, source_1, source_2, LDR_out, Clk, Result_1, Result_2);
Memory_Control();
MASTER_ALU master(Reg1, Reg2, IV, OpCode, Cond, S, Result, Flag, New_Flag);

always @(posedge Clk)
    begin

Enable =1;   RW=0;    Address=16'h0000;    In =32'hAAAAAAAA;
#5 Enable =1;   RW=0;    Address=16'h0000;    In =32'haBBBAAAA;
#5 Enable =1;   RW=0;    Address=16'h0001;    In =32'hCCCC00AA;
#5 Enable =1;   RW=0;    Address=16'h0002;    In =32'hDDDD00BB;
#5 Enable =1;   RW=0;    Address=16'h0003;    In =32'hEEEE00CC;
#5 Enable =1;   RW=0;    Address=16'h0004;    In =32'hFFFF00DD;
#5 Enable =1;   RW=0;    Address=16'h0005;    In =32'hAAAA00EE;
#5 Enable =1;   RW=0;    Address=16'h0006;    In =32'hBBBB00FF;
#5 Enable =1;   RW=0;    Address=16'h0007;    In =32'hCCCCFFFF;
#5 Enable =1;   RW=0;    Address=16'h0008;    In =32'hAAAAAAAA;
#5 Enable =1;   RW=0;    Address=16'h0009;    In =32'haBBBAAAA;
#5 Enable =1;   RW=0;    Address=16'h000A;    In =32'hCCCC00AA;
#5 Enable =1;   RW=0;    Address=16'h000B;    In =32'hDDDD00BB;
#5 Enable =1;   RW=0;    Address=16'h000C;    In =32'hEEEE00CC;
#5 Enable =1;   RW=0;    Address=16'h000D;    In =32'hFFFF00DD;
#5 Enable =1;   RW=0;    Address=16'h000E;    In =32'hAAAA00EE;
#5 Enable =1;   RW=0;    Address=16'h000F;    In =32'hBBBB00FF;
#5 Enable =1;   RW=0;    Address=16'h0010;    In =32'hCCCCFFFF;
#10

  $writememh("data_h.txt", ram.Mem);
end
endmodule





