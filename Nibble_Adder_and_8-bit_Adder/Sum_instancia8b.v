module Sum_instancia8b (
input [7:0] i_bit1,
input [7:0] i_bit2,
input i_Carry,
output [7:0] o_Suma,
output o_Carry
);
wire [7:0] c; // Acarreos internos

SumadorCompleto FA0 (.i_a(i_bit1[0]), .i_b(i_bit2[0]), .i_cin(i_Carry),
.o_suma(o_Suma[0]), .o_cout(c[0]));
SumadorCompleto FA1 (.i_a(i_bit1[1]), .i_b(i_bit2[1]), .i_cin(c[0]),
.o_suma(o_Suma[1]), .o_cout(c[1]));

SumadorCompleto FA2 (.i_a(i_bit1[2]), .i_b(i_bit2[2]), .i_cin(c[1]),
.o_suma(o_Suma[2]), .o_cout(c[2]));
SumadorCompleto FA3 (.i_a(i_bit1[3]), .i_b(i_bit2[3]), .i_cin(c[2]),
.o_suma(o_Suma[3]), .o_cout(c[3]));
SumadorCompleto FA4 (.i_a(i_bit1[4]), .i_b(i_bit2[4]), .i_cin(c[3]),
.o_suma(o_Suma[4]), .o_cout(c[4]));
SumadorCompleto FA5 (.i_a(i_bit1[5]), .i_b(i_bit2[5]), .i_cin(c[4]),
.o_suma(o_Suma[5]), .o_cout(c[5]));
SumadorCompleto FA6 (.i_a(i_bit1[6]), .i_b(i_bit2[6]), .i_cin(c[5]),
.o_suma(o_Suma[6]), .o_cout(c[6]));
SumadorCompleto FA7 (.i_a(i_bit1[7]), .i_b(i_bit2[7]), .i_cin(c[6]),
.o_suma(o_Suma[7]), .o_cout(o_Carry));

endmodule

