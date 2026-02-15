module MedioSumador (
    input i_a,
    input i_b,
    output o_suma,
    output o_carry
);

    assign o_suma = i_a ^ i_b;   // XOR para la suma
    assign o_carry = i_a & i_b;  // AND para el acarreo

endmodule