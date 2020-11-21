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

wire [7:0] pc; // mem
wire [31:0] reg_data;// mem



reg Enable; //RAM STUFF
reg RW_ram;
wire RW_mem;
reg [15:0] Address_in; //Ram Address
wire [15:0] Address_out; //mem Address
wire [31:0] Out;  //Ram output

wire signed [31:0] Result; // ALU wires
wire [3:0] New_Flag; //ALU Wires

//Register bank part 
wire [31:0] LDR_out; //Register Bank
wire [31:0] Result_1,  Result_2; //Memory

//split the instruction part


RAM ram(Enable,RW_ram,Address_in,In,Out);
Register_bank regbank(destination, source_1, source_2, LDR_out, Clk, Result_1, Result_2);
memory_control memcontrol(Result_1, Result_2, OpCode, RW_mem, Address_out, reg_data, LDR, STR ,LDR_out, STR_in, Counter, Reset, Clk, pc, Result );
MASTER_ALU master(Reg1, Reg2, IV, OpCode, Cond, S, Result, Flag, New_Flag);

always @(posedge Clk)

begin


Enable =1;   RW_ram=0;		 Address_in=16'h0000;    instruction =32'b00000110001010000000000001100000;
#5 Enable =1;   RW_ram=0;    Address_in=16'h0001;    instruction =32'b00000110000010000000000000100000;
#5 Enable =1;   RW_ram=0;    Address_in=16'h0002;    instruction =32'b00000110001000000000000001000000;
#5 Enable =1;   RW_ram=0;    Address_in=16'h0003;    instruction =32'b00000110000100000000000000110000;
#5 Enable =1;   RW_ram=0;    Address_in=16'h0004;    instruction =32'b00000000000110010000100000000000;
#5 Enable =1;   RW_ram=0;    Address_in=16'h0005;    instruction =32'b00001001001000010000000010000000;
#5 Enable =1;   RW_ram=0;    Address_in=16'h0006;    instruction =32'b00000010001010010000100000000000;
#5 Enable =1;   RW_ram=0;    Address_in=16'h0007;    instruction =32'b00000001101110100010100000000000;
#5 Enable =1;   RW_ram=0;    Address_in=16'h0008;    instruction =32'b00001011000000011010000000000000;
#5 Enable =1;   RW_ram=0;    Address_in=16'h0009;    instruction =32'b00010110000110000000001111111000;
#10

$writememh("data_h.txt", ram.Mem);

Cond = instruction[31:28]; 
OpCode =  instruction[27:24];
S =  instruction[23];
destination = instruction[22:19];
source_2 = instruction[18:15];
source_1 = instruction[14:11];
IV = instruction[10:6];
end
endmodule
 