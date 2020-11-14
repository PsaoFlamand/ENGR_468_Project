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

always @*
begin
    case (OpCode)
        4'b0000: ADD Add(Reg1, Reg2, Result, Flag, S, New_Flag);
        4'b0001: SUB Sub(Reg1, Reg2, Result, Flag, S, New_Flag);
        4'b0010: MUL Mul(Reg1, Reg2, Result, Flag, S, New_Flag);
        4'b0011: OR Orr(Reg1, Reg2, Result, Flag, S, New_Flag);
        4'b0100: AND And(Reg1, Reg2, Result, Flag, S, New_Flag);
        4'b0101: XOR Xor(Reg1, Reg2, Result, Flag, S, New_Flag);
        4'b0110: MOV mov(Reg1, IV);
        4'b0111: MOV mov(Reg1, Reg2);
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
            ROR #(4) lsl(Reg2, IV, Result, Flag, S, New_Flag);
            MOV mov(Reg1, Result)
        end
        4'b1011: SET_FLAG set(Reg1, Reg2, Result, Flag, S, New_Flag);
        4'b1100: 
        4'b1101:
        4'b1110:
        4'b1111:
        default: 
    endcase
end


endmodule