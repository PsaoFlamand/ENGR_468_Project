// Mux for register bank: 32 bits 16 X 1 mux 
module mux(clk, out_mux, sel,r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
input clk;
input [3:0] sel;
input [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;
output reg [31:0] out_mux;

always @*
begin 
	case(sel)
	4'b0000 : out_mux= r0;
	4'b0001 : out_mux= r1;
	4'b0010 : out_mux= r2;
	4'b0011 : out_mux= r3;
	4'b0100 : out_mux= r4;
	4'b0101 : out_mux= r5;
	4'b0110 : out_mux= r6;
	4'b0111 : out_mux= r7;
	4'b1000 : out_mux= r8;
	4'b1001 : out_mux= r9;
	4'b1010 : out_mux= r10;
	4'b1011 : out_mux= r11;
	4'b1100 : out_mux= r12;
	4'b1101 : out_mux= r13;
	4'b1110 : out_mux= r14;
	4'b1111 : out_mux= r15;
	default: out_mux=0;
	endcase
end 
endmodule 

