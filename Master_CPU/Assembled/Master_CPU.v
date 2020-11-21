module TEST_MASTER_CPU;

reg [31:0] instruction;
reg Clk;

reg [3:0] Cond; //ALU
reg [3:0] OpCode; //Memory, ALU
reg S; //ALU
reg [3:0] destination; //Register Bank
reg [3:0] source_1, source_2; //Register Bank
reg [4:0] IV; //ALU
reg signed [31:0] Reg1, Reg2; //ALU
reg [3:0] Flag; //ALU

reg [7:0] pc; // mem
reg [31:0] reg_data;// mem



reg  Enable,RW; //RAM STUFF
reg [15:0] Address; //Ram Address
wire [31:0] Out;  //Ram output

wire signed [31:0] Result; // ALU wires
wire [3:0] New_Flag; //ALU Wires

//Register bank part 
wire [31:0] LDR_out; //Register Bank
wire [31:0] Result_1,  Result_2; //Memory

//split the instruction part


RAM ram(Enable,RW,Address,In,Out);
Register_bank regbank(destination, source_1, source_2, LDR_out, Clk, Result_1, Result_2);
memory_control memcontrol(Result_1, Result_2, OpCode, RW, Address, reg_data, LDR, STR ,LDR_out, STR_in, Counter, Reset, Clk, pc, Result );
MASTER_ALU master(Reg1, Reg2, IV, OpCode, Cond, S, Result, Flag, New_Flag);

always @(posedge Clk)

begin
Cond = instruction[31:28]; 
OpCode =  instruction[27:24];
S =  instruction[23];
destination = instruction[22:19];
source_2 = instruction[18:15];
source_1 = instruction[14:11];
IV = instruction[10:6];

Enable =1;   RW=0;    Address=16'h0000;       instruction =32'hAAAAAAAA;
#5 Enable =1;   RW=0;    Address=16'h0000;    instruction =32'haBBBAAAA;
#5 Enable =1;   RW=0;    Address=16'h0001;    instruction =32'hCCCC00AA;
#5 Enable =1;   RW=0;    Address=16'h0002;    instruction =32'hDDDD00BB;
#5 Enable =1;   RW=0;    Address=16'h0003;    instruction =32'hEEEE00CC;
#5 Enable =1;   RW=0;    Address=16'h0004;    instruction =32'hFFFF00DD;
#5 Enable =1;   RW=0;    Address=16'h0005;    instruction =32'hAAAA00EE;
#5 Enable =1;   RW=0;    Address=16'h0006;    instruction =32'hBBBB00FF;
#5 Enable =1;   RW=0;    Address=16'h0007;    instruction =32'hCCCCFFFF;
#5 Enable =1;   RW=0;    Address=16'h0008;    instruction =32'hAAAAAAAA;
#5 Enable =1;   RW=0;    Address=16'h0009;    instruction =32'haBBBAAAA;
#5 Enable =1;   RW=0;    Address=16'h000A;    instruction =32'hCCCC00AA;
#5 Enable =1;   RW=0;    Address=16'h000B;    instruction =32'hDDDD00BB;
#5 Enable =1;   RW=0;    Address=16'h000C;    instruction =32'hEEEE00CC;
#5 Enable =1;   RW=0;    Address=16'h000D;    instruction =32'hFFFF00DD;
#5 Enable =1;   RW=0;    Address=16'h000E;    instruction =32'hAAAA00EE;
#5 Enable =1;   RW=0;    Address=16'h000F;    instruction =32'hBBBB00FF;
#5 Enable =1;   RW=0;    Address=16'h0010;    instruction =32'hCCCCFFFF;
#10

$writememh("data_h.txt", ram.Mem);
end
endmodule
 