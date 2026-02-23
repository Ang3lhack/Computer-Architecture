module SLT32(
input[31:0]SLTo1,
input[31:0]SLTo2,
output[31:0]RSLT
);
assign RSLT = SLTo1 < SLTo2 ? 1:0;
endmodule
