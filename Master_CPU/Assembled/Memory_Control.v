module memory_control (SR1, SR2, op_code, address_out ,ALU_result, reg_data, RW, RAM_in, RAM_out, memory_enable,IV_Mov);

input [31:0] ALU_result, RAM_out;
input [31:0] SR1, SR2;
input [3:0] op_code;
input memory_enable;
input [15:0] IV_Mov;

output reg RW;
output reg [31:0] address_out, reg_data, RAM_in;
wire [31:0]out_add, out_LDR,out_ADR;
reg sel_add, sel_LDR;
reg Reset;

always @*
	case (op_code)
 	4'b1100: //ADR
	begin
		sel_add=0;
		sel_LDR=0;
		RW=1;
		Reset=0;
		
//		RAM_in=1'bx; 
		RAM_in=out_ADR;
		address_out= out_add; 
		reg_data=out_ADR;	
	end 
	
	4'b1110: // STR
	begin
		//sel_add=1;
		sel_add=0;
		sel_LDR=0;
		RW=0;
		Reset=0;
		
		RAM_in = SR2; 
		address_out = SR1; 
		//$monitor($time, "RAM_in:%b, address_out:%b ", RAM_in, address_out);
		reg_data = out_ADR;	
	end 

	4'b1101: //LDR
	begin
		//sel_add=1;
		sel_add=0;
		//sel_LDR=1;
		sel_LDR=0;
		RW=1;
		Reset=0;
		
		address_out= out_add; 
		reg_data=out_LDR;	
	end 

	default: // ALU instructions
	begin 
		sel_add=0;
		sel_LDR=0;
		RW=0;
		address_out=out_add;
		
		if (memory_enable==1'b1)
		begin
		reg_data=out_LDR;	
		end

		//else 
		//reg_data=reg_data;  // check 
	end 
endcase

//initial
//begin

//$monitor($time, "reg_data:%d ", reg_data);

//end 
Address_bus addbus(out_add, SR1, sel_add,Reset);

LDR_MUX LDRMux(out_LDR, ALU_result, RAM_out, sel_LDR); //for LDR 
LDR_MUX LDRMux1(out_ADR, IV_Mov, RAM_out, sel_LDR);//for ADR and STR
endmodule 
