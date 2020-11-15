module CONDITIONAL(In1, In2, Cond, Flag, Execute);
input signed [31:0] In1, In2;
input [3:0] Cond;
input [3:0] Flag;

wire [3:0] New_Flag;  //[N=3, Z=2, C=1, V=0]
output reg Execute;


CMP cmp(In1, In2, Flag, 1'b1, New_Flag);

//assign Execute = (Cond = 4'b0000) ? 1 : (Cond = 4'b0001 && New_Flag[2] == 1)) 1 : (Cond = 4'b0010 && New_Flag[2]);
always @*
	begin
		case(Cond)
			4'b0000: //No condition
			begin
				Execute = 1;
			end
			4'b0001: //EQ - Equal
			begin
				if(New_Flag[2])
					Execute = 1;
				else
					Execute = 0;
			end
			4'b0010: //GT - Greater than
			begin
				if(New_Flag[2]==0 && (New_Flag[3]==New_Flag[2]))
					Execute = 1;
				else 
					Execute = 0;
			end
			4'b0011: //LT - Less than
			begin
				if(New_Flag[3]!=New_Flag[0])
					Execute = 1;
				else
					Execute = 0;
			end
			4'b0100: //GE - Greater than or equal to
			begin
				if(New_Flag[3]==New_Flag[0])
                Execute = 1;
            else
                Execute = 0;
			end
			4'b0101: //LE - Less than or equal to
			begin
				if(New_Flag[2]==1 || (New_Flag[3]!=New_Flag[0]))
					Execute = 1;
				else
					Execute = 0;
			end
			4'b0110: //HI - Unsigned higher
			begin
				if(New_Flag[1]==1 && New_Flag[2]==0)
					Execute = 1;
				else
					Execute = 0;
			end
			4'b0111: //LO - Unsigned lower
			begin
				if(New_Flag[1]==0)
					Execute = 1;
				else
					Execute = 0;
			end
			4'b1000: //HS - Unsigned higher or same
			begin
				if(New_Flag[1]==1)
					Execute = 1;
				else
					Execute = 0;
			end
			default:#0;
		endcase
	end

endmodule