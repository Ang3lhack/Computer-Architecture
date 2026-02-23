module S32Comp (
input [31:0] i_bit1,
input [31:0] i_bit2,
input i_Carry,
output [31:0] o_Suma,
output o_Carry
);
assign {o_Carry, o_Suma} = i_bit1 + i_bit2 + i_Carry;

endmodule
