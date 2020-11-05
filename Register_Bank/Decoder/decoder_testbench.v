// testbench for decoder 
module test_decoder;
reg Clock;
reg [3:0] Address;
wire [15:0] Enable ;

initial
begin
$display($time, " Test My Design");
end

initial
begin
$monitor($time, " Clock=%b, Address=%b, Enable=%b", Clock, Address, Enable);
end

initial
begin
 Clock=0;
Address=4'b0000;
#10 Address=4'b0001;
#10 Address=4'b0101;
#10 Address=4'b0011;
#10 Address=4'b1001;
#10 Address=4'b0101;
#10 Address=4'b0011;
#10 Address=4'b1001;
#10 Address=4'b0101;
#10 Address=4'b0001;
#10 Address=4'b1111;
#10 Address=4'b0000;
#155 $finish; // Stop the simulation after 162 time units
end
always #5 Clock=~Clock; // How to create a clock pulses of period 10
decoder MUT(Clock, Address, Enable);
endmodule