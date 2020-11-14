

// testbench for LDR mux in memory control 
module test_LDR_mux;
reg LDR;
reg [31:0] Ram_input, ALU_result;
wire [31:0] Register_output ;

initial
begin
$display($time, " Test My Design");
end

initial
begin
$monitor($time, "LDR=%b, Data from Ram=%b, Result from ALU=%b, Output from MUX=%b",LDR, Ram_input, ALU_result,Register_output);end

initial
begin
LDR=0; 
Ram_input=32'b10000000100000001000000010000000;
ALU_result=32'b10001000100010001000100010001000;
#10 LDR=0; 
#10 LDR=1; 
#10 LDR=1; 
#10 LDR=0; 
#10 LDR=1; 
#100 $finish; // Stop the simulation after 162 time units
end

LDR_mux MUT(LDR,Register_output, Ram_input, ALU_result);


endmodule