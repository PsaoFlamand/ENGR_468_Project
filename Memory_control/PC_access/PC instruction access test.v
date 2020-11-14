// testbench for pc instruction. Memory control 

module PC_access_testbench;
reg Clock, Rst;
wire [7:0] Output_Count;
initial
begin
$display($time, " Test My Design");
end
initial
begin
$monitor($time, " Clk=%b, Reset=%d, Count=%d", Clock, Rst, Output_Count);
end
initial
begin
Clock=0;
Rst=1;
#3 Rst=0;
#4 Rst=1;
#155 $finish; // Stop the simulation after 162 time units
end
always #5 Clock=~Clock; // How to create a clock pulses of period 10
PC_access MUT(Clock, Rst, Output_Count);
endmodule
