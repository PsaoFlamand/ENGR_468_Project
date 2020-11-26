module TEST_MASTER_CPU;
 
/*ALU ports*/
wire signed [31:0] Result,Result_mem; // ALU wires


wire [3:0] New_Flag; //ALU Wires
reg Clk;

/* instruction ports */
reg [31:0] instruction;
wire [3:0] Cond; //ALU
wire [3:0] OpCode; //Memory, ALU
wire S; //ALU
wire [3:0] destination; //Register Bank
wire [3:0] source_1, source_2; //Register Bank
wire [4:0] IV_ShiftRor; //ALU
reg signed [31:0] Reg1, Reg2; //ALU
reg [3:0] Flag; //ALU
wire [15:0] IV_Mov;

/* Memory ports*/
wire [31:0] reg_data;

/*RAM ports*/
reg Enable; //RAM STUFF
wire RW_ram;
wire [31:0] Address_in; //Ram Address
//wire [15:0] Address_out; //mem Address
wire [31:0] Out;  //Output from RAM 
wire [31:0]In;   //Input to Ram 

/*Register bank ports*/
wire [31:0] Result_1,  Result_2; //Memory
wire [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;

/*initiate modules*/
RAM ram(Enable,RW_ram,Address_in,In,Out);
Register_bank regbank(destination, source_1, source_2, reg_data, Clk, Result_1, Result_2);
memory_control memcontrol(Result_1, Result_2, OpCode, Address_in, Result, reg_data, RW_ram, In, Out,Clk);
MASTER_ALU master(Result_1, Result_2, IV_Shiftror, IV_Mov, OpCode, Cond, S, Result, Flag, New_Flag);

//always @(posedge Clk)
//assign LDR_out=Result;
//assign Result_mem=10;

/*split the instruction*/
assign instruction=Out;
assign Cond = instruction[31:28]; 
assign OpCode =  instruction[27:24];
assign S =  instruction[23];
assign destination = instruction[22:19];
//
assign source_2 = instruction[18:15];
assign source_1 = instruction[14:11];
assign IV_ShiftRor = instruction[10:6];
//
assign IV_Mov=instruction[18:3];

/*initiation*/
initial
begin  
Clk=0;
Reg1=10;
Reg2=10;

//reg_data_reg=reg_data_mem;
//$readmemh("data_h.txt", ram.Mem);
   Enable =0; instruction=32'b00000110001010000000000001100000;//   RW_ram=1;	Address_in=32'd0;	
#5 Enable =1; //  RW_ram=1;	Address_in=32'd0;	
#5 Enable =0;//  RW_ram=1;	Address_in=32'd1;	
#5 Enable =1; // RW_ram=1;	Address_in=32'd2;	
#5 Enable =1;//  RW_ram=1;	Address_in=32'd3;	
#5 Enable =1; // RW_ram=1;	Address_in=32'd4;	
#5 Enable =1; // RW_ram=1;	Address_in=32'd5;	
#5 Enable =1;//  RW_ram=1;	Address_in=32'd6;	
#5 Enable =1;//  RW_ram=1;	Address_in=32'd7;	
#5 Enable =1; // RW_ram=1;	Address_in=32'd8;	
#5 Enable =1; // RW_ram=1;	Address_in=32'd9;
#155 $finish;
end

initial
begin

//$monitor($time, "reg_data:%d Reg1:%d Reg2:%d Cond:%b S:%b destination:%b source_2:%b source_1:%b IV_ShiftRor:%d IV_Mov:%d address:%b OpCode:%b Result:%d flag :%b \n \n \n R0=%d, R1=%d, R2=%d, R3=%d, R4=%d R5=%d, R6=%d, R7=%d, R8=%d, R9=%d, R10=%d, R11=%d, R12=%d, R13=%d, R14=%d,R15=%d \n \n ",

// reg_data, Result_1, Result_2,Cond,S,destination,source_2, source_1, IV_ShiftRor, IV_Mov,Address_in, OpCode, Result,New_Flag, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
$monitor($time, instruction);
end 
always #5 Clk=~Clk; // How to create a clock pulses of period 10
endmodule

