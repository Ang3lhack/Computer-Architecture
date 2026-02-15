module Tb_Sum8b;
    reg  [7:0] r_bit1;
    reg  [7:0] r_bit2;
    reg        r_cin;
    
    wire [7:0] w_suma_inst;
    wire       w_cout_inst;
    wire [7:0] w_suma_comp;
    wire       w_cout_comp;

    // Instancias
    Sum_instancia8b UUT_Inst (
        .i_bit1(r_bit1), .i_bit2(r_bit2), .i_Carry(r_cin),
        .o_Suma(w_suma_inst), .o_Carry(w_cout_inst)
    );

    Sum_com8b UUT_Comp (
        .i_bit1(r_bit1), .i_bit2(r_bit2), .i_Carry(r_cin),
        .o_Suma(w_suma_comp), .o_Carry(w_cout_comp)
    );

    initial begin
        $display("--- Testbench Sumador 8 Bits ---");
        $display("Time | A     + B     + Cin | Sum(Inst) Cout | Sum(Comp) Cout");
        
        // Prueba 1: Simple
        r_bit1 = 8'd20; r_bit2 = 8'd30; r_cin = 0;
        #10;
        $display("%4t | %d  + %d  + %d   | %d       %d    | %d       %d", $time, r_bit1, r_bit2, r_cin, w_suma_inst, w_cout_inst, w_suma_comp, w_cout_comp);

        // Prueba 2: Límite sin carry
        r_bit1 = 8'd100; r_bit2 = 8'd150; r_cin = 0;
        #10;
        $display("%4t | %d + %d + %d   | %d       %d    | %d       %d", $time, r_bit1, r_bit2, r_cin, w_suma_inst, w_cout_inst, w_suma_comp, w_cout_comp);

        // Prueba 3: Desbordamiento (250 + 10 = 260 -> Carry y 4)
        r_bit1 = 8'd250; r_bit2 = 8'd10; r_cin = 0;
        #10;
        $display("%4t | %d + %d  + %d   | %d         %d    | %d         %d", $time, r_bit1, r_bit2, r_cin, w_suma_inst, w_cout_inst, w_suma_comp, w_cout_comp);

        // Prueba 4: Con carry de entrada
        r_bit1 = 8'd127; r_bit2 = 8'd1; r_cin = 1;
        #10;
        $display("%4t | %d + %d   + %d   | %d       %d    | %d       %d", $time, r_bit1, r_bit2, r_cin, w_suma_inst, w_cout_inst, w_suma_comp, w_cout_comp);

        // Prueba 5: Maximos
        r_bit1 = 8'd255; r_bit2 = 8'd255; r_cin = 1;
        #10;
        $display("%4t | %d + %d + %d   | %d       %d    | %d       %d", $time, r_bit1, r_bit2, r_cin, w_suma_inst, w_cout_inst, w_suma_comp, w_cout_comp);
        
        $finish;
    end
endmodule

