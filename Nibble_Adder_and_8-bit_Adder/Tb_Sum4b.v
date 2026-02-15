module Tb_Sum4b;
    // Señales para conectar
    reg  [3:0] r_bit1;
    reg  [3:0] r_bit2;
    reg        r_cin;
    
    // Salidas de la version Instanciada
    wire [3:0] w_suma_inst;
    wire       w_cout_inst;
    
    // Salidas de la version Comportamental
    wire [3:0] w_suma_comp;
    wire       w_cout_comp;

    // Instancia del modulo Estructural
    Sum_instancia4b UUT_Inst (
        .i_bit1(r_bit1), .i_bit2(r_bit2), .i_Carry(r_cin),
        .o_Suma(w_suma_inst), .o_Carry(w_cout_inst)
    );

    // Instancia del modulo Comportamental
    Sum_com4b UUT_Comp (
        .i_bit1(r_bit1), .i_bit2(r_bit2), .i_Carry(r_cin),
        .o_Suma(w_suma_comp), .o_Carry(w_cout_comp)
    );

    initial begin
        $display("--- Testbench Sumador 4 Bits ---");
        $display("Time | A    + B    + Cin | Sum(Inst) Cout | Sum(Comp) Cout");
        
        // Prueba 1: 2 + 2
        r_bit1 = 4'd2; r_bit2 = 4'd2; r_cin = 0;
        #10;
        $display("%4t | %d + %d + %d   | %d        %d    | %d        %d", $time, r_bit1, r_bit2, r_cin, w_suma_inst, w_cout_inst, w_suma_comp, w_cout_comp);

        // Prueba 2: 10 + 5
        r_bit1 = 4'd10; r_bit2 = 4'd5; r_cin = 0;
        #10;
        $display("%4t | %d + %d + %d  | %d        %d    | %d        %d", $time, r_bit1, r_bit2, r_cin, w_suma_inst, w_cout_inst, w_suma_comp, w_cout_comp);

        // Prueba 3: 15 + 1 (Desbordamiento/Carry)
        r_bit1 = 4'd15; r_bit2 = 4'd1; r_cin = 0;
        #10;
        $display("%4t | %d + %d + %d  | %d        %d    | %d        %d", $time, r_bit1, r_bit2, r_cin, w_suma_inst, w_cout_inst, w_suma_comp, w_cout_comp);

        // Prueba 4: 7 + 7 + 1 (Con Carry de entrada)
        r_bit1 = 4'd7; r_bit2 = 4'd7; r_cin = 1;
        #10;
        $display("%4t | %d + %d + %d   | %d        %d    | %d        %d", $time, r_bit1, r_bit2, r_cin, w_suma_inst, w_cout_inst, w_suma_comp, w_cout_comp);

        // Prueba 5: Maximos valores
        r_bit1 = 4'd15; r_bit2 = 4'd15; r_cin = 1;
        #10;
        $display("%4t | %d + %d + %d  | %d        %d    | %d        %d", $time, r_bit1, r_bit2, r_cin, w_suma_inst, w_cout_inst, w_suma_comp, w_cout_comp);
        
        $finish;
    end
endmodule
