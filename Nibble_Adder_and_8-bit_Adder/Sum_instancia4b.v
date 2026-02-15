module Sum_instancia4b (
input [3:0] i_bit1,
input [3:0] i_bit2,
input i_Carry,
output [3:0] o_Suma,
output o_Carry
);
wire [3:0] c; // Cables para acarreos internos

// Instancia de 4 Sumadores Completos
// Bit 0 (LSB)

SumadorCompleto FA0 (.i_a(i_bit1[0]), .i_b(i_bit2[0]), .i_cin(i_Carry),
.o_suma(o_Suma[0]), .o_cout(c[0]));
// Bit 1
SumadorCompleto FA1 (.i_a(i_bit1[1]), .i_b(i_bit2[1]), .i_cin(c[0]),
.o_suma(o_Suma[1]), .o_cout(c[1]));
// Bit 2
SumadorCompleto FA2 (.i_a(i_bit1[2]), .i_b(i_bit2[2]), .i_cin(c[1]),
.o_suma(o_Suma[2]), .o_cout(c[2]));
// Bit 3 (MSB)
SumadorCompleto FA3 (.i_a(i_bit1[3]), .i_b(i_bit2[3]), .i_cin(c[2]),
.o_suma(o_Suma[3]), .o_cout(o_Carry));

endmodule

