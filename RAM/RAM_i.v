module RAM_i(Enable, RW, Address, In, Out);
input  Enable,RW;
input [31:0] In;
input [15:0] Address;
output [31:0] Out;
reg [31:0] Out;
reg [31:0] instr [0:15];//16 x 32 memory

always @*
	   if (Enable)
             if (RW) 
              Out = instr[Address];  		//Read
             else
              instr[Address] = In;   		//Write
	   else Out = 16'bz;        	//High impedance state
endmodule