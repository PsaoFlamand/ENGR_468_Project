// testbench for MUX 
module mux_testbench;
reg Clock;
reg[3:0] Select;
reg [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;
wire [31:0] Output;

initial
begin
$display($time, " Test My Design");
end

initial
begin
$monitor($time, " Clock=%b, Select=%b, Output from MUX=%d, Register=%d  ", Clock, Select, Output, r1);
end

initial
begin
 Clock=0;
Select=4'b0000;
#10 Select=4'b0001;
r1=32'b00001010101010101010101010101010;
#10 ;

#20 $finish; // Stop the simulation after 162 time units
end
always #5 Clock=~Clock; // How to create a clock pulses of period 10
mux MUT(Clock, Output, Select, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
endmodule
