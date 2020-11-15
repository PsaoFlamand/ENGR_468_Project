`include "../ADD-P\'sao/ADD.v"
`include "../AND-P\'sao/AND.v"
`include "../COUNTER/COUNTER.v"
`include "../LSL/LSL.v"
`include "../LSR-P\'sao/LSR.v"
`include "../MOV/MOV.v"
`include "../MUL-P\'sao/MUL.v"
`include "../MUX/MUX.v"
`include "../ADD-P\'sao/ADD.v"
`include "../ADD-P\'sao/ADD.v"
`include "../OR/OR.v"
`include "../ROR-P\'sao/ROR.v"
`include "../SET_FLAG-P\'sao/SET_FLAG.v"
`include "../SUB/SUB.v"
`include "../XOR/XOR.v"
`include "../CMP/CMP.v"

module MASTER_ALU(Reg1, Reg2, IV, OpCode, Cond, S, Result, Flag, New_Flag);
input [31:0] Reg1, Reg2;
input [15:0] IV;
input [3:0] OpCode;
input [3:0] Cond;
input S;
input [3:0] Flag;
output [31:0] Result;
output [3:0] New_Flag;

//Wires for in1 and in2
wire [31:0] in1_ADD, in2_ADD, 
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
in1_CMP, in2_CMP;

//wires for Result
wire [31:0] result_ADD, result_AND, result_CMP, result_LSL, 
result_LSR, result_MUL, result_OR, result_ROR, result_SUB, result_XOR;

//wires for Flags
wire [3:0] flag_ADD, flag_AND, flag_CMP, flag_LSL, flag_LSR, flag_MUL, flag_OR, flag_ROR, flag_SUB, flag_XOR;

//wires for S
wire s_ADD, s_AND, s_CMP, s_LSL, s_LSR, s_MUL, s_OR, s_ROR, s_SUB, s_XOR;

//wires for New_Flag
wire [3:0] newflag_ADD, newflag_AND, newflag_CMP, newflag_LSL,
 newflag_LSR, newflag_MUL, newflag_OR, newflag_ROR, newflag_SUB, newflag_XOR

reg [31:0] Result;
reg [3:0] Flag;

//Instantiating modules depending on OpCodes
ADD Add(Reg1, Reg2, Result, Flag, S, New_Flag);

SUB Sub(Reg1, Reg2, Result, Flag, S, New_Flag);

MUL Mul(Reg1, Reg2, Result, Flag, S, New_Flag);

OR Orr(Reg1, Reg2, Result, Flag, S, New_Flag);

AND And(Reg1, Reg2, Result, Flag, S, New_Flag);

XOR Xor(Reg1, Reg2, Result, Flag, S, New_Flag);

MOV mov(Reg1, IV);

MOV mov(Reg1, Reg2);

LSR #(4) lsr(Reg2, IV, Result, Flag, S, New_Flag);
MOV mov(Reg1, Result);

LSL #(4) lsl(Reg2, IV, Result, Flag, S, New_Flag);
MOV mov(Reg1, Result);

ROR #(4) ror(Reg2, IV, Result, Flag, S, New_Flag);
MOV mov(Reg1, Result)

CMP cmp(Reg1, Reg2, Result, Flag, S, New_Flag);

always @*
begin
    case (OpCode)
        4'b0000: 
        begin
            in1_ADD = Reg1;
            in2_ADD = Reg2;
            result_ADD = Result;
            flag_ADD = Flag;
            s_ADD = S;
            newflag_ADD = New_Flag;
        end
        4'b0001: 
        begin
            in1_SUB = Reg1;
            in2_SUB = Reg2;
            result_SUB = Result;
            flag_SUB = Flag;
            s_SUB = S;
            newflag_SUB = New_Flag;
        end
        4'b0010: 
        begin
            in1_MUL = Reg1;
            in2_MUL = Reg2;
            result_MUL = Result;
            flag_MUL = Flag;
            s_MUL = S;
            newflag_MUL = New_Flag;
        end
        4'b0011: 
        begin
            in1_OR = Reg1;
            in2_OR = Reg2;
            result_OR = Result;
            flag_OR = Flag;
            s_OR = S;
            newflag_OR = New_Flag;
        end
        4'b0100: 
        begin
            in1_AND = Reg1;
            in2_AND = Reg2;
            result_AND = Result;
            flag_AND = Flag;
            s_AND = S;
            newflag_AND = New_Flag;
        end
        4'b0101: 
        begin
            in1_XOR = Reg1;
            in2_XOR = Reg2;
            result_XOR = Result;
            flag_XOR = Flag;
            s_XOR = S;
            newflag_XOR = New_Flag;
        end
        4'b0110: 
        begin
            in1_MOVn = Reg1;
            in2_MOVn = IV;
        end
        4'b0111: 
        begin
            in1_MOV = Reg1;
            in2_MOV = Reg2;
        end
        4'b1000: 
        begin
            in1_LSR = Reg1;
            in2_LSR = Reg2;
            result_LSR = Result;
            flag_LSR = Flag;
            s_LSR = S;
            newflag_LSR = New_Flag;
        end
        4'b1001: 
        begin
            in1_LSL = Reg1;
            in2_LSL = Reg2;
            result_LSL = Result;
            flag_LSL = Flag;
            s_LSL = S;
            newflag_LSL = New_Flag;
        end
        4'b1010: 
        begin
            in1_ROR = Reg1;
            in2_ROR = Reg2;
            result_ROR = Result;
            flag_ROR = Flag;
            s_ROR = S;
            newflag_ROR = New_Flag;
        end
        4'b1011: 
        begin
            in1_CMP = Reg1;
            in2_CMP = Reg2;
            result_CMP = Result;
            flag_CMP = Flag;
            s_CMP = S;
            newflag_CMP = New_Flag;
        end
        4'b1100: 
        4'b1101:
        4'b1110:
        4'b1111:
        default: 
    endcase
    
end

endmodule