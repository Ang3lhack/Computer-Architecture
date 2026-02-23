module mux5a1(
input [31:0] suma,resta,_or,_and,_slt,
input[3:0]ALUct1,
output reg [31:0]R
);

always @(ALUct1) 
begin
case (ALUct1)
            4'b0000: R = _and;   
            4'b0001: R = _or;    
            4'b0010: R = suma;   
            4'b0110: R = resta;  
            4'b0111: R = _slt;   
        endcase
    end

endmodule