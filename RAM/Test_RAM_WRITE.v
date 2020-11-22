module TEST_RAM_WRITE; 
    reg  Enable,RW;
    reg [31:0] In;
    reg [15:0] Address;
    wire [31:0] Out;

RAM ram(Enable,RW,Address,In,Out); 

initial  
begin
   Enable =1;   RW=0;	Address=16'b0000;	In =32'b00000110001010000000000001100000;
#5 Enable =1;   RW=0;	Address=16'b0001;	In =32'b00000110000010000000000000100000;
#5 Enable =1;   RW=0;	Address=16'b0010;	In =32'b0000110001000000000000001000000;
#5 Enable =1;   RW=0;	Address=16'b0011;	In =32'b00000110000100000000000000110000;
#5 Enable =1;   RW=0;	Address=16'b0100;	In =32'b00000000000110010000100000000000;
#5 Enable =1;   RW=0;	Address=16'b0101;	In =32'b00001001001000010000000010000000;
#5 Enable =1;   RW=0;	Address=16'b0110;	In =32'b00000010001010010000100000000000;
#5 Enable =1;   RW=0;	Address=16'b0111;	In =32'b00000001101110100010100000000000;
#5 Enable =1;   RW=0;	Address=16'b1000;	In =32'b00001011000000011010000000000000;
#5 Enable =1;   RW=0;	Address=16'b1001;	In =32'b00010110000110000000001111111000;

#10

  $writememh("data_h.txt", ram.Mem);
end
endmodule
