module ALUMIPS (
    input [31:0] A,         
    input [31:0] B,       
    input [3:0]  Sel,       
    output [31:0] R         
);

   
    wire [31:0] w_and, w_or, w_suma, w_resta, w_slt;
    wire c_out_suma, c_out_resta;

  
    And32Comp comp_and (
        .Ao1(A), 
        .Ao2(B), 
        .AR(w_and)
    );

  
    OR32Comp comp_or (
        .Ro1(A), 
        .Ro2(B), 
        .RR(w_or)
    );

   
    S32Comp comp_suma (
        .i_bit1(A), 
        .i_bit2(B), 
        .i_Carry(1'b0),     
        .o_Suma(w_suma), 
        .o_Carry(c_out_suma)
    );

    
    R32Comp comp_resta (
        .i_bit1(A), 
        .i_bit2(B), 
        .i_Carry(1'b0), 
        .o_Suma(w_resta), 
        .o_Carry(c_out_resta)
    );

   
    SLT32 comp_slt (
        .SLTo1(A), 
        .SLTo2(B), 
        .RSLT(w_slt)
    );

   
    mux5a1 MUXsa1 (
        .suma(w_suma),
        .resta(w_resta),
        ._or(w_or),
        ._and(w_and),
        ._slt(w_slt),
        .ALUct1(Sel),
        .R(R)
    );

endmodule