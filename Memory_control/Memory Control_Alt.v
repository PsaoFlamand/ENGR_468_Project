// master code of memory control module 
// pc instruction access, part of memory control 
module memory_control (op_code, SR1, SR2, STR, LDR, RW, data_reg, add_bus, data_bus,pc,alu_result,Clk, Reset);

input [3:0] op_code;
input[31:0] SR1, SR2, alu_result;
input [7:0]pc;
input Clk, Reset;
output reg LDR,STR, RW;
output reg [31:0] data_reg, add_bus, data_bus;

always @*

	begin 
		case(op_code)
			4'b1101:
				begin
					LDR=1;
					RW=1;

				end
			4'b1110:
				begin
					STR=1;
					RW=0;
					data_bus=SR2;

				end
			//default: 
		endcase
	end
//Address_bus AD2 (SR1, pc, LDR, STR, add_bus); // Maybe we don't need this one
Address_bus AB1(SR1, pc, LDR, STR, add_bus);
LDR_mux LD1(LDR, data_reg, data_bus,alu_result);
PC_access PC1(Clk, Reset, pc);
endmodule


/////////////////////////////////////////////////////////////////////Calling Instances



