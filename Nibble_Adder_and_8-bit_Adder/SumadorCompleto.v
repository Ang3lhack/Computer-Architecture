module SumadorCompleto (
input i_a,
input i_b,
input i_cin,
output o_suma,
output o_cout
);
wire w_sum1, w_carry1, w_carry2;

// Instancia 1: Medio Sumador para A y B
MedioSumador HA1 (
.i_a(i_a),
.i_b(i_b),
.o_suma(w_sum1),
.o_carry(w_carry1)

);

// Instancia 2: Medio Sumador para el resultado parcial y el Carry de entrada
MedioSumador HA2 (
.i_a(w_sum1),
.i_b(i_cin),
.o_suma(o_suma),
.o_carry(w_carry2)
);

// El carry de salida es la OR de los acarreso intermedios
assign o_cout = w_carry1 | w_carry2;

endmodule

