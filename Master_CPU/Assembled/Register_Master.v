module Register_bank(Dest, Source1, Source2, ldr_in, Result_1, Result_2,);

input [3:0] Dest, Source1, Source2;
input [31:0] ldr_in;
output [31:0] Result_1, Result_2;



wire [15:0] en;
wire [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;

decoder d1(Dest, en);
reg_bank R1(en, ldr_in, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
mux m1(Result_1, Source1,  r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
mux m2(Result_2, Source2,  r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
//initial
//begin

//$monitor($time, "Dest=%d, data=%d, R0=%d, R1=%d, R2=%d, R3=%d, R4=%d R5=%d, R6=%d, R7=%d, R8=%d, R9=%d, R10=%d, R11=%d, R12=%d, R13=%d, R14=%d,R15=%d \n \n ",

//Dest,ldr_in, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);

//end 
endmodule
