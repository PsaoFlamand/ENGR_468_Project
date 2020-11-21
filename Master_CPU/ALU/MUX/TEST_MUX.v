module TEST_MUX;	//[N, Z, C, V}]
reg [31:0] In1, In2, In3, In4, In5, In6, In7, In8, In9, In10, In11, In12, In13, In14, In15, In16;
reg [3:0] Sel;
wire [31:0] out;
//reg S;
//reg [3:0] Flag;
//wire signed [31:0] Result;
//wire [3:0] New_Flag;

initial
begin
$display($time, "MUX Testbench");
In1=1; In2=2; In3=3; In4=4; In5=5; In6=6; In7=7; In8=8; In9=9; In10=10; In11=11; In12=12; In13=13; In14=14; In15=15; In16=16; Sel=0;
#10 In1=1; In2=2; In3=3; In4=4; In5=5; In6=6; In7=7; In8=8; In9=9; In10=10; In11=11; In12=12; In13=13; In14=14; In15=15; In16=16; Sel=1;
#10 In1=1; In2=2; In3=3; In4=4; In5=5; In6=6; In7=7; In8=8; In9=9; In10=10; In11=11; In12=12; In13=13; In14=14; In15=15; In16=16; Sel=2; 
#10 In1=1; In2=2; In3=3; In4=4; In5=5; In6=6; In7=7; In8=8; In9=9; In10=10; In11=11; In12=12; In13=13; In14=14; In15=15; In16=16; Sel=3;
#10 In1=1; In2=2; In3=3; In4=4; In5=5; In6=6; In7=7; In8=8; In9=9; In10=10; In11=11; In12=12; In13=13; In14=14; In15=15; In16=16; Sel=5;
#10 In1=1; In2=2; In3=3; In4=4; In5=5; In6=6; In7=7; In8=8; In9=9; In10=10; In11=11; In12=12; In13=13; In14=14; In15=15; In16=16; Sel=8;
#10 In1=1; In2=2; In3=3; In4=4; In5=5; In6=6; In7=7; In8=8; In9=9; In10=10; In11=11; In12=12; In13=13; In14=14; In15=15; In16=16; Sel=13;
#10 In1=1; In2=2; In3=3; In4=4; In5=5; In6=6; In7=7; In8=8; In9=9; In10=10; In11=11; In12=12; In13=13; In14=14; In15=15; In16=16; Sel=0;
end
initial
begin
$monitor($time, " In1.=%d, In2.=%d, In3.=%d, In4.=%d, In5.=%d, In6.=%d, In7.=%d, In8.=%d, In9.=%d, In10.=%d, In11.=%d, In12.=%d, In13.=%d, In14.=%d, In15.=%d, In16.=%d, Sel=%d, out.=%d", In1, In2, In3, In4, In5, In6, In7, In8, In9, In10, In11, In12, In13, In14, In15, In16, Sel, out);
end
MUX mux1(In1, In2, In3, In4, In5, In6, In7, In8, In9, In10, In11, In12, In13, In14, In15, In16, Sel, out);

endmodule
