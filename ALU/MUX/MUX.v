module MUX(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, sel, out);

input [31:0] in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16;
input [3:0] sel;
output [31:0] out;

reg [31:0] out;

always @*
begin
    
    case(sel)
        4b'0000: out = in1;
        4b'0001: out = in2;
        4b'0010: out = in3;
        4b'0011: out = in4;
        4b'0100: out = in5;
        4b'0101: out = in6;
        4b'0110: out = in7;
        4b'0111: out = in8;
        4b'1000: out = in9;
        4b'1001: out = in10;
        4b'1010: out = in11;
        4b'1011: out = in12;
        4b'1100: out = in13;
        4b'1101: out = in14;
        4b'1110: out = in15;
        4b'1111: out = in16;
        default: 32b'x;
    endcase

end

endmodule