module test_memory;
reg [31:0]SR1, SR2;
reg [3:0] op_code;
reg Reset, Clk;
reg [31:0] LDR_out,alu_result;
wire RW, LDR, STR, STR_in;
wire [31:0]address_out;
wire [31:0]reg_data;
wire Counter,add_bus;
wire mux_out, address_input;
wire [7:0]pc;

initial
begin
$display($time, " Test My Design");
end

initial
begin
$monitor($time, " Inputs: Clock=%d, Reset=%d, OP Code=%b, LDR=%b, STR=%b, RW=%b, Source 1=%d,Source 2=%d, ALU result=%d, Data from Ram; Outputs: Address to RAM=%d, Data to register bank=%d ",Clk, Reset, op_code, LDR, STR, RW,SR1, SR2, alu_result, address_out, reg_data );
end 

initial
begin
SR1=32'b00000000000000000000000000010000;
SR2=32'b00000000000000000000000000001000;
alu_result=32'b00000000000000000000000010000000;
LDR_out=32'b00000000000000000000000010000000;
Clk=0;
op_code=1100; // ADR
#10 op_code=4'b1100; //ADR
#10 op_code=4'b1101; //LDR
#10 op_code=4'b1101; SR1=32'b00000000000000000000000000100000; //LDR
#10 op_code=4'b1101; SR1=32'b00000000000000000000000000000001; //LDR
#10 op_code=4'b1110; //STR
#10 op_code=4'b1110; //STR
#10 op_code=4'b1110; SR1=32'b00000000000000000000000000110000; SR2=32'b00000000000000000000000000001111;//STR
#10 op_code=4'b1111; Reset=0; //Other insturctions, PC
#10 op_code=4'b1111; Reset=1; //Other insturctions, PC
#10 op_code=4'b1100; //Other insturctions, PC
#10 op_code=4'b1010; //Other insturctions, PC
#10 op_code=4'b1001; //Other insturctions, PC
#10 op_code=4'b1111; //Other insturctions, PC
#160 $finish; // Stop the simulation 
end

always #10 Clk=~Clk; // How to create a clock pulses of period 10
memory_control MUT(SR1, SR2, op_code, RW, address_out, reg_data, LDR, STR ,LDR_out,STR_in,Counter, Reset,Clk,pc,alu_result);
endmodule
