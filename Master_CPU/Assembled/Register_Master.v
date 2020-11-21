module Register_bank(Dest, Source1, Source2, ldr_in, clk, Result_1, Result_2);

input [3:0] Dest, Source1, Source2;
input [31:0] ldr_in;
output [31:0] Result_1, Result_2;

input clk;

wire [15:0] en;
wire [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;

decoder d1(clk, Dest, en);
reg_bank R1(clk, en, ldr_in, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
mux m1(clk, Result_1, Source1,  r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
mux m2(clk, Result_2, Source2,  r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);

endmodule
