module Test_register_bank;
reg [3:0] Destination, Source1, Source2;
reg [31:0] ALU_Result;
wire [31:0] Output_1, Output_2;
wire [31:0] r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15;

reg Clock;

initial
begin
$display($time, " Test My Design");
end

initial
begin
//$monitor($time, " Clock=%b, Dest=%b, Source1=%d, Source2=%d, ldr_in=%d, Output from MUX1=%d, MUX1=%d  ", Clock, Destination, Source1, Source2, ALU_Result, Output_1, Output_2);
$monitor($time,
 " Inputs: Dest=%d, Source 1=%d, Source 2=%d, LDR Data=%d; Output: R0=%d, R1=%d, R2=%d, R3=%d, R4=%d, enable From MUX 1=%d, From MUX 2=%d  ", 

Destination, Source1, Source2, ALU_Result, r0, r1, r2, r3, r4, Output_1, Output_2);

end

initial
begin
 //Clock=0;
Destination=4'b0000; Source1= 4'b0000; Source2= 4'b0000;
ALU_Result=32'b00000000000000000000000000000000;

#10 
Destination=4'b0001;Source1= 4'b0001;Source2= 4'b0001;
ALU_Result=32'b00000000000000000000000000000001;

#10 ;
Destination=4'b0010;Source1= 4'b0011;Source2= 4'b0001;
ALU_Result=32'b00000000000000000000000000000010;

#10 ;
Destination=4'b0011;Source1= 4'b0010;Source2= 4'b0010;
ALU_Result=32'b00000000000000000000000000000100;

#10 ;
Destination=4'b0100;Source1= 4'b0001;Source2= 4'b0010;
ALU_Result=32'b00000000000000000000000000001000;

#150 $finish; 
end
//always #5 Clock=~Clock; // How to create a clock pulses of period 10
Register_bank MUT(Destination, Source1, Source2, ALU_Result, Clock, Output_1, Output_2, r0, r1, r2, r3, r4, r5, r6 ,r7, r8, r9, r10, r11, r12, r13, r14, r15);
endmodule
