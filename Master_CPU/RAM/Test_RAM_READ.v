module TEST_RAM_READ;
reg  Enable,RW;
reg [31:0] In;
reg [15:0] Address;
wire [31:0] Out;

RAM ram(Enable,RW,Address,In,Out); 

initial
begin  

  $readmemh("data_h.txt", ram.Mem);

   Enable =0;   RW=0;	Address=32'd0;	
#5 Enable =1;   RW=1;	Address=32'd0;	
#5 Enable =1;   RW=1;	Address=32'd1;	
#5 Enable =1;   RW=1;	Address=32'd2;	
#5 Enable =1;   RW=1;	Address=32'd3;	
#5 Enable =1;   RW=1;	Address=32'd4;	
#5 Enable =1;   RW=1;	Address=32'd5;	
#5 Enable =1;   RW=1;	Address=32'd6;	
#5 Enable =1;   RW=1;	Address=32'd7;	
#5 Enable =1;   RW=1;	Address=32'd8;	
#5 Enable =1;   RW=1;	Address=32'd9;	
#5 Enable =1;   RW=1;	Address=32'd10;	
#5 Enable =1;   RW=1;	Address=32'd11;	
#5 Enable =1;   RW=1;	Address=32'd12;	
#5 Enable =1;   RW=1;	Address=32'd13;	
#5 Enable =1;   RW=1;	Address=32'd14;	
#5 Enable =1;   RW=1;	Address=32'd15;	
#5 Enable =1;   RW=1;	Address=32'd16;	
end


initial
begin
$monitor($time, "data at address %d is %h", Address, Out);
end
endmodule