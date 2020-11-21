module TEST_COUNTER;	//[N, Z, C, V}]
reg clk, reset;
wire [7:0] count;

initial
begin
$display($time, " Program Counter");
end

initial
begin
$monitor($time, " clk.=%d, reset.=%d, count=%d", clk, reset, count);
end

initial
begin
clk = 0;
reset = 1;
#10 reset = 0;
#10 reset = 1;
#10 reset = 0;
#10 reset = 1;
#150 $finish;
end

always #2 clk = ~clk;

COUNTER counter(clk, reset, count);

endmodule
