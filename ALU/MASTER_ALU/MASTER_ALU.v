`include "../ADD/ADD.v"
`include "../AND/AND.v"
`include "../COUNTER/COUNTER.v"
`include "../LSL/LSL.v"
`include "../LSR/LSR.v"
`include "../MOV/MOV.v"
`include "../MUL/MUL.v"
`include "../MUX/MUX.v"
`include "../OR/OR.v"
`include "../ROR/ROR.v"
`include "../SET_FLAG/SET_FLAG.v"
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

reg [31:0] Result;
reg [3:0] Flag;

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
				Reg1=Reg1;
            4'b0001: 
            4'b0010: 
            4'b0011: 
            4'b0100: 
            4'b0101: 
            4'b0110: 
            4'b0111: 
            4'b1000: 
            begin
                LSR #(4) lsr(Reg2, IV, Result, Flag, S, New_Flag);
                MOV mov(Reg1, Result);
            end
            4'b1001: 
            begin
                LSL #(4) lsl(Reg2, IV, Result, Flag, S, New_Flag);
                MOV mov(Reg1, Result);
            end
            4'b1010: 
            begin
                ROR #(4) ror(Reg2, IV, Result, Flag, S, New_Flag);
                MOV mov(Reg1, Result)
            end
            4'b1011: CMP cmp(Reg1, Reg2, Result, Flag, S, New_Flag);
            4'b1100: 
            4'b1101:
            4'b1110:
            4'b1111:
            default: 
        endcase
    
end


endmodule