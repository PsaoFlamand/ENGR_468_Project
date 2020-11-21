module memory_control(SR1, SR2, op_code, RW, address_out, reg_data, LDR, STR ,LDR_out,STR_in,Counter, Reset,Clk,pc,alu_result);
input [31:0] SR1, SR2;
input [3:0] op_code;
input Reset, Clk;
input [31:0] LDR_out,alu_result;
output reg RW, LDR, STR, STR_in;
output reg[31:0] address_out;
output reg [31:0] reg_data;
output reg Counter;

wire mux_out, address_input;
wire add_bus;
output reg [7:0] pc;

always @(posedge Clk) 
 case(op_code)
	4'b1100: //ADR
	begin	
		LDR=0;
		STR=0;
		RW=0;
		reg_data=SR1;
	end	
	4'b1110: //STR
	begin
		LDR=0;
		STR=1;
		RW=0;
		address_out=SR1;
		STR_in=SR2;
		reg_data=alu_result;
	end
	4'b1101: //LDR
	begin
		LDR=1;
		STR=0;
		RW=1;
		address_out= SR1; 
		reg_data=LDR_out;			
	end 
	default: //Instructions other than LDR, STR or ADR, PC instructions 
	begin 
	
		if (! Reset)
			begin 
			LDR=0; STR=0;RW=1;
			pc=8'b00000000;
			address_out=pc;
			reg_data=alu_result;
			end
		else
			begin
			LDR=0; STR=0;RW=1;
			pc = pc+1;
			address_out=pc;
			reg_data=alu_result;
			end
		end
  endcase
endmodule
