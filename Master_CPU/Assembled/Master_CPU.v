//testing 1126
module TEST_MASTER_CPU;

wire [31:0] instruction;
reg Clk;

wire [3:0] Cond; //ALU
wire [3:0] OpCode; //Memory, ALU
wire S; //ALU
wire [3:0] destination; //Register Bank
wire [3:0] source_1, source_2; //Register Bank
wire [4:0] IV_ShftRor; //ALU
reg signed [31:0] Reg1, Reg2; //ALU
reg [3:0] Flag; //ALU
wire [15:0] IV_Mov;

wire [7:0] pc; // mem
wire [31:0] reg_data_reg,alu_result;// mem
wire [31:0] reg_data_mem;
wire [31:0] reg_data;
reg Enable; //RAM STUFF
wire RW_ram;
wire RW_mem;
wire [15:0] Address_in; //Ram Address
wire [15:0] Address_out; //mem Address
wire [31:0] Out;  //Ram output

wire signed [31:0] Result; // ALU wires
wire [3:0] New_Flag; //ALU Wires
wire memory_enable;

//Register bank part 
wire [31:0] LDR_out; //Register Bank
wire [31:0] Result_1,  Result_2; //Memory

wire [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;
//split the instruction part

//reg Reset;
//RAM ram(Enable,RW_ram,Address_in,In,Out);
//Register_bank regbank(destination, source_1, source_2, reg_data_reg, Clk, Result_1, Result_2);
//memory_control memcontrol(Result_1, Result_2, OpCode, RW_mem, Address_out, reg_data_mem, LDR, STR ,LDR_out, STR_in, Counter, Reset, Clk, pc, alu_result); //Result_mem is input?
//MASTER_ALU master(Reg1, Reg2, IV_Shiftror, IV_Mov, OpCode, Cond, S, Result, Flag, New_Flag); //Result_1,2 are wires? Won't work as inputs

RAM ram(Enable,RW_ram,Address_in,In,Out);
Register_bank regbank(destination, source_1, source_2, reg_data, Result_1, Result_2, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15,memory_enable);
memory_control memcontrol(Result_1, Result_2, OpCode, Address_out, Result, reg_data, RW_mem, In, Out,memory_enable);
MASTER_ALU master(Result_1, Result_2, IV_ShftRor, IV_Mov, OpCode, Cond, S, Result, Flag, New_Flag,memory_enable);
//always @(posedge Clk)
//assign LDR_out=Result;
//assign Result_mem=10;

assign instruction = Out;
assign Cond = instruction[31:28]; 
assign OpCode =  instruction[27:24];
assign S =  instruction[23];
assign destination = instruction[22:19];
//
assign source_2 = instruction[18:15];
assign source_1 = instruction[14:11];
assign IV_ShftRor = instruction[10:6];
//
assign IV_Mov=instruction[18:3];

assign Address_in=Address_out;
assign RW_ram= RW_mem;
//assign Result_1=10;
//assign Result_2=10;

assign reg_data_reg=reg_data;
initial
begin  
//$monitor($time, "IV:%b ", IV_ShftRor);
//Clk=1;
//Reset=1; //


Flag=4'b0000;



$readmemh("C:\\Users\\Anthony\\Documents\\GitHub\\ENGR_468_Project\\Master_CPU\\Assembled\\instructions.txt", ram.Mem);
   Enable =0; // RW_ram=1;	Address_in=32'd0;	//addresses must be fixed
#5 Enable =1; // RW_ram=1;	Address_in=32'd0;	
#5 Enable =1; // RW_ram=1;	Address_in=32'd1;	
#5 Enable =1; //  RW_ram=1;	Address_in=32'd2;	
#5 Enable =1;  // RW_ram=1;	Address_in=32'd3;	
#5 Enable =1;  // RW_ram=1;	Address_in=32'd4;	
#5 Enable =1;  // RW_ram=1;	Address_in=32'd5;	
#5 Enable =1;  // RW_ram=1;	Address_in=32'd6;	
#5 Enable =1;  // RW_ram=1;	Address_in=32'd7;	
#5 Enable =1;  // RW_ram=1;	Address_in=32'd8;	
#5 Enable =1; //  RW_ram=1;	Address_in=32'd9;
#5 Enable =1; // RW_ram=1;	Address_in=32'd10;	
#5 Enable =1;//  RW_ram=1;	Address_in=32'd11;	
#5 Enable =1;  // RW_ram=1;	Address_in=32'd12;	
#5 Enable =1; //  RW_ram=1;	Address_in=32'd13;	
#5 Enable =1; //  RW_ram=1;	Address_in=32'd14;	
#5 Enable =1;  // RW_ram=1;	Address_in=32'd15;	
#5 Enable =1;  // RW_ram=1;	Address_in=32'd16;	
#5 Enable =1;  // RW_ram=1;	Address_in=32'd17;	
#5 Enable =1; //  RW_ram=1;	Address_in=32'd18;	
#5 Enable =1; //  RW_ram=1;	Address_in=32'd19;

end

initial
begin

//$monitor($time, "reg_data:%d Reg1:%d Reg2:%d Cond:%b S:%b destination:%b source_2:%b source_1:%b IV_ShiftRor:%d IV_Mov:%d address:%b OpCode:%b Result:%d flag :%b \n \n \n R0=%d, R1=%d, R2=%d, R3=%d, R4=%d R5=%d, R6=%d, R7=%d, R8=%d, R9=%d, R10=%d, R11=%d, R12=%d, R13=%d, R14=%d,R15=%d \n \n ",

// reg_data, Result_1, Result_2,Cond,S,destination,source_2, source_1, IV_ShftRor, IV_Mov,Address_in, OpCode, Result,New_Flag, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);

$monitor($time, " address_in:%d, address out:$d" Address_in, Address_out);

end 

endmodule

//$monitor($time, "reg_data:%d Reg1:%d Reg2:%d destination:%b source_2:%b source_1:%b address:%b Result:%d flag :%b \n \n \n  R5=%d",

 //reg_data, Result_1, Result_2,destination,source_2, source_1,Address_out, Result, New_Flag,r5);


//$monitor($time, "reg_data:%d Reg1:%d Reg2:%d Cond:%b S:%b destination:%b source_2:%b source_1:%b IV_ShiftRor:%d IV_Mov:%d address:%b OpCode:%b Result:%d flag :%b \n \n \n R0=%d, R1=%d, R2=%d, R3=%d, R4=%d R5=%d, R6=%d, R7=%d, R8=%d, R9=%d, R10=%d, R11=%d, R12=%d, R13=%d, R14=%d,R15=%d \n \n ",

// reg_data_mem, Result_1, Result_2,Cond,S,destination,source_2, source_1, IV_ShiftRor, IV_Mov,Address_in, OpCode, Result,New_Flag, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
