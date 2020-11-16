module Register_bank(Dest, Source1, Source2, ldr_in, clk, Result_1, Result_2);

input [3:0] Dest, Source1, Source2;
input [31:0] ldr_in;
output [31:0] Result_1, Result_2;

input clk;

wire [15:0] en;
wire [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;

decoder d1(.clk(clk), .dest(Dest), .enable(en));
reg_bank R1(.clk(clk), .enable(en), .ldr_data(ldr_in), .r0(r0), .r1(r1), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7), .r8(r8), .r9(r9), .r10(r10), .r11(r11), .r12(r12), .r13(r13), .r14(r14), .r15(r15));
mux m1(.clk(clk), .out_mux(Result_1), .sel(Source1),  .r0(r0), .r1(r1), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7), .r8(r8), .r9(r9), .r10(r10), .r11(r11), .r12(r12), .r13(r13), .r14(r14), .r15(r15));
mux m2(.clk(clk), .out_mux(Result_2), .sel(Source2),  .r0(r0), .r1(r1), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7), .r8(r8), .r9(r9), .r10(r10), .r11(r11), .r12(r12), .r13(r13), .r14(r14), .r15(r15));

endmodule
