
// testbench for register bank 
module register_bank_test;
reg Clock;
reg[15:0] Enable;
reg [31:0] ALU_Result;
wire [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;

initial
begin
$display($time, " Test My Design");
end

initial
begin
$monitor($time, " Clock=%b, Enable=%d, Data from ALU=%d, Register0=%d,  Register1=%d, Register2=%d, Register3=%d, ", Clock, Enable, ALU_Result, r0, r1, r2, r3);
end

initial
begin
 Clock=0;
ALU_Result=32'b00000000000000000000000000000000;
Enable=16'b0000000000000001;
#10 ALU_Result=32'b10101010101010101010101010101010;
Enable=16'b0000000000000010;
#10 ALU_Result=32'b00000000000000000000000000000010;
Enable=16'b0000000000000100;
#10 ALU_Result=32'b00000000000000000000000000001010;
Enable=16'b0000000000001000;

/*
#10 Address=4'b0101;
#10 Address=4'b0011;
#10 Address=4'b1001;
#10 Address=4'b0101;
#10 Address=4'b0011;
#10 Address=4'b1001;
#10 Address=4'b0101;
#10 Address=4'b0001;
#10 Address=4'b1111;
#10 Address=4'b0000;
*/
#20 $finish; // Stop the simulation after 162 time units
end
always #5 Clock=~Clock; // How to create a clock pulses of period 10
reg_bank MUT(Clock, Enable, ALU_Result, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15 );
endmodule
