module TEST_RAM_WRITE; 
    reg  Enable,RW;
    reg [31:0] In;
    reg [15:0] Address;
    wire [31:0] Out;

RAM ram(Enable,RW,Address,In,Out); 

initial  
begin
   Enable =1;   RW=0;	Address=16'h0000;	In =32'hAAAAAAAA;
#5 Enable =1;   RW=0;	Address=16'h0000;	In =32'haBBBAAAA;
#5 Enable =1;   RW=0;	Address=16'h0001;	In =32'hCCCC00AA;
#5 Enable =1;   RW=0;	Address=16'h0002;	In =32'hDDDD00BB;
#5 Enable =1;   RW=0;	Address=16'h0003;	In =32'hEEEE00CC;
#5 Enable =1;   RW=0;	Address=16'h0004;	In =32'hFFFF00DD;
#5 Enable =1;   RW=0;	Address=16'h0005;	In =32'hAAAA00EE;
#5 Enable =1;   RW=0;	Address=16'h0006;	In =32'hBBBB00FF;
#5 Enable =1;   RW=0;	Address=16'h0007;	In =32'hCCCCFFFF;
#10

  $writememh("data_h.txt", ram.Mem);
end
endmodule
