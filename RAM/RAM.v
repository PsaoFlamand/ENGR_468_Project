module RAM(Enable, RW, Address, In, Out);
input  Enable,RW;
input [31:0] In;
input [15:0] Address;
output [31:0] Out;
reg [31:0] Out;
reg [31:0] Mem [0:(1<<16)-1];//65536 x 32 memory

always @*
	   if (Enable)
             if (RW) 
              Out = Mem[Address];  		//Read
             else
              Mem[Address] = In;   		//Write
	   else Out = 16'bz;        	//High impedance state
endmodule