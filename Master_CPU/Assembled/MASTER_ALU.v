//`include "../ADD/ADD.v"
//`include "../AND/AND.v"
//`include "../COUNTER/COUNTER.v"
//`include "../LSL/LSL.v"
//`include "../LSR/LSR.v"
//`include "../MOV/MOV.v"
//`include "../MUL/MUL.v"
//`include "../MUX/MUX.v"
//`include "../OR/OR.v"
//`include "../ROR/ROR.v"
//`include "../SET_FLAG/SET_FLAG.v"
//`include "../SUB/SUB.v"
//`include "../XOR/XOR.v"
//`include "../CMP/CMP.v"

module MASTER_ALU(Reg1, Reg2, IV_ShftRor,IV_Mov, OpCode, Cond, S, Result, Flag, New_Flag);
input signed [31:0] Reg1, Reg2;
input [15:0] IV_Mov;
input [4:0] IV_ShftRor;
input [3:0] OpCode;
input [3:0] Cond;
input S;
input [3:0] Flag;
output reg signed [31:0] Result;
output reg [3:0] New_Flag;

//Wires for in1 and in2
reg [31:0] in1_ADD, in2_ADD, 
in1_SUB, in2_SUB, 
in1_MUL, in2_MUL, 
in1_OR, in2_OR, 
in1_AND, in2_AND, 
in1_XOR, in2_XOR, 
in1_MOVn, in2_MOVn,
in1_MOV, in2_MOV,
in1_LSL, in2_LSL,
in1_LSR, in2_LSR,
in1_ROR, in2_ROR,
in1_CMP, in2_CMP,
in1_CON, in2_CON;

//wires for Result
wire signed [31:0] result_ADD, result_AND, result_CMP, result_LSL, 
result_LSR, result_MUL, result_OR, result_ROR, result_SUB, result_XOR,out1_MOVn,out1_MOV;

//wires for Flags
reg [3:0] flag_ADD, flag_AND, flag_CMP, flag_LSL, flag_LSR, flag_MUL, flag_OR, flag_ROR, flag_SUB, flag_XOR,Flag_con;

//wires for S
reg s_ADD, s_AND, s_CMP, s_LSL, s_LSR, s_MUL, s_OR, s_ROR, s_SUB, s_XOR;

//wires for New_Flag
wire [3:0] newflag_ADD, newflag_AND, newflag_CMP, newflag_LSL,
newflag_LSR, newflag_MUL, newflag_OR, newflag_ROR, newflag_SUB, newflag_XOR;

reg [4:0] iv_LSL, iv_LSR, iv_ROR;

reg [3:0] COND_con;

reg Execute_con=1'b1;

//Register Display
//wire [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;
//Instantiating modules depending on OpCodes






	
always @*

begin
	
	Execute_con = ( (Cond == 4'b0000) ) || ( (Cond == 4'b0001) && (New_Flag[2]) ) || ( (Cond == 4'b0010)&&(New_Flag[2]==0)&&(New_Flag[3] == New_Flag[0]) )
	|| ( (Cond == 4'b0011)&&(New_Flag[3]!=New_Flag[0]) ) || ( (Cond == 4'b0100)&&(New_Flag[3]==New_Flag[0]) )
	|| ( (Cond == 4'b0101)&&(New_Flag[2] || (New_Flag[3]!=New_Flag[0])) )|| ( (Cond == 4'b0110)&&(New_Flag[1])&&(New_Flag[2]==0) )
	|| ( (Cond == 4'b0111)&&(New_Flag[1]==0) )|| ( (Cond == 4'b1000)&&(New_Flag[1]) ) ?  1'b1 : 0;
	
	
	
	
	/*
	Execute_con = ( (Cond == 4'b0001) && (New_Flag[2]) ) ? 1'b1 : 0;
	
	Execute_con = ( (Cond == 4'b0010)&&(New_Flag[2]==0)&&(New_Flag[3] == New_Flag[0]) ) ? 1'b1 : 0;
	Execute_con = ( (Cond == 4'b0011)&&(New_Flag[3]!=New_Flag[0]) ) ? 1'b1 : 0;
	Execute_con = ( (Cond == 4'b0100)&&(New_Flag[3]==New_Flag[0]) )  ? 1'b1 : 0;
	Execute_con = ( (Cond == 4'b0101)&&(New_Flag[2] || (New_Flag[3]!=New_Flag[0])) ) ? 1'b1 : 0;
	Execute_con = ( (Cond == 4'b0110)&&(New_Flag[1])&&(New_Flag[2]==0) ) ? 1'b1 : 0;
	Execute_con = ( (Cond == 4'b0111)&&(New_Flag[1]==0) ) ? 1'b1 : 0;
	Execute_con = ( (Cond == 4'b1000)&&(New_Flag[1]) ) ? 1'b1 : 0;
	*/
	
	//in1_CON=Reg1;
	//in2_CON=Reg2;
	//COND_con=Cond;
	//Flag_con=Flag;
	//Execute_con=1'b1;
	if (OpCode==4'b0000 && Execute_con==1'b1) //0000 ADD
        begin
            in1_ADD = Reg1;
            in2_ADD = Reg2;
            
            flag_ADD = Flag;
            s_ADD = S;
			Result=result_ADD;
            New_Flag=newflag_ADD;
        end
	else if (OpCode==4'b0001 && Execute_con==1'b1) // 0001 SUB
        begin
            in1_SUB = Reg1;
            in2_SUB = Reg2;
            
            flag_SUB = Flag;
            s_SUB = S;
			Result=result_SUB;
            New_Flag=newflag_SUB;
        end
    else if (OpCode==4'b0010 && Execute_con==1'b1)// 0010 MUL
        begin
            in1_MUL = Reg1;
            in2_MUL = Reg2;
            
            flag_MUL = Flag;
            s_MUL = S;
			Result=result_MUL;
            New_Flag=newflag_MUL;
        end
    else if (OpCode==4'b0011 && Execute_con==1'b1) //0011 OR
        begin
            in1_OR = Reg1;
            in2_OR = Reg2;
            
            flag_OR = Flag;
            s_OR = S;
			Result=result_OR;
            New_Flag=newflag_OR;
        end
    else if (OpCode==4'b0100 && Execute_con==1'b1) // 0100 AND
        begin
            in1_AND = Reg1;
            in2_AND = Reg2;
            
            flag_AND = Flag;
            s_AND = S;
			Result=result_AND;
            New_Flag=newflag_AND;
        end
    else if (OpCode==4'b0101 && Execute_con==1'b1) //0101 XOR
        begin
            in1_XOR = Reg1;
            in2_XOR = Reg2;
            
            flag_XOR = Flag;
            s_XOR = S;
			Result=result_XOR;
            New_Flag=newflag_XOR;
        end
    else if (OpCode==4'b0110 && Execute_con==1'b1)  //0110 MOVn
        begin
            Result=out1_MOV;
            in1_MOV = IV_Mov;
			
        end
    else if (OpCode==4'b0111 && Execute_con==1'b1) //0111 MOV
        begin
            Result=out1_MOV;
            in1_MOV = Reg2;
        end
    else if (OpCode==4'b1000 && Execute_con==1'b1) //1000 LSR
        begin
            in1_LSR = Reg2;
            in2_LSR = IV_ShftRor;
            
            
            flag_LSR = Flag;
            s_LSR = S;
			Result=result_LSR;
            New_Flag=newflag_LSR;
        end
    else if (OpCode==4'b1001 && Execute_con==1'b1) //1001 LSL
        begin
            in1_LSL = Reg2;
            in2_LSL = IV_ShftRor;//Must be IV
            
            //$monitor($time, "IV:%b ", IV_ShftRor);
            flag_LSL = Flag;
            s_LSL = S;
			Result=result_LSL;
            New_Flag=newflag_LSL;
        end
    else if (OpCode==4'b1010 && Execute_con==1'b1) //1010 ROR
        begin
            in1_ROR = Reg2;
            in2_ROR = IV_ShftRor;
            
            
            flag_ROR = Flag;
            s_ROR = S;
			Result=result_ROR;
            New_Flag=newflag_ROR;
        end
    else if (OpCode==4'b1011 && Execute_con==1'b1) //1011 CMP
        begin
            in1_CMP = Reg1;
            in2_CMP = Reg2;
      
            flag_CMP = Flag;
            s_CMP = 1'b1;
            New_Flag=newflag_CMP;
        end
        //4'b1100:		//Part of memory control ADR
        //4'b1101:		//Part of memory control LDR
        //4'b1110:		//Part of memory control STR
        //4'b1111:
    else #0;
    
end

//CONDITIONAL con(in1_CON, in2_CON, COND_con, Flag_con, Execute_con);

ADD Add(in1_ADD, in2_ADD, result_ADD, flag_ADD, s_ADD, newflag_ADD);
SUB Sub(in1_SUB, in2_SUB, result_SUB, flag_SUB, s_SUB, newflag_SUB);
MUL Mul(in1_MUL, in2_MUL, result_MUL, flag_MUL, s_MUL, newflag_MUL);
OR Orr(in1_OR, in2_OR, result_OR, flag_OR, s_OR, newflag_OR);
AND And(in1_AND, in2_AND, result_AND, flag_AND, s_AND, newflag_AND);
XOR Xor(in1_XOR, in2_XOR, result_XOR, flag_XOR, s_XOR, newflag_XOR);
LSR #(5) lsr(in1_LSR, in2_LSR, result_LSR, flag_LSR, s_LSR, newflag_LSR); //I changed the second inputs
LSL #(5) lsl(in1_LSL, in2_LSL, result_LSL, flag_LSL, s_LSL, newflag_LSL);

ROR #(5) ror(in2_ROR, iv_ROR, result_ROR, flag_ROR, s_ROR, newflag_ROR);
CMP cmp(in1_CMP, in2_CMP, flag_CMP, s_CMP, newflag_CMP);
MOV mov(in1_MOV, out1_MOV);

endmodule
