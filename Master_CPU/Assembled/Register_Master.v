module Register_bank(Dest, Source1, Source2, ldr_in, Result_1, Result_2,r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15,memory_enable);

input [3:0] Dest, Source1, Source2;
input [31:0] ldr_in;
input memory_enable; 
output [31:0] Result_1, Result_2;
output [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;


wire [15:0] en;

decoder d1(Dest, en);
reg_bank R1(en, ldr_in, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15, memory_enable);
mux m1(Result_1, Source1,  r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
mux m2(Result_2, Source2,  r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);

endmodule