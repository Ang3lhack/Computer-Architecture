module Sum_com8b (
    input  [7:0] i_bit1,
    input  [7:0] i_bit2,
    input        i_Carry,
    output [7:0] o_Suma,
    output       o_Carry
);

    
    wire w_carry_intermedio;

  
    Sum_com4b SumaBaja (
        .i_bit1 (i_bit1[3:0]),      
        .i_bit2 (i_bit2[3:0]), 
        .i_Carry(i_Carry),         
        .o_Suma (o_Suma[3:0]),      
        .o_Carry(w_carry_intermedio)
    );

  
    Sum_com4b SumaAlta (
        .i_bit1 (i_bit1[7:4]),      
        .i_bit2 (i_bit2[7:4]),
        .i_Carry(w_carry_intermedio), 
        .o_Suma (o_Suma[7:4]),      
        .o_Carry(o_Carry)          
    );

endmodule
