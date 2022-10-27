// IEEE 754 Operation + - * /
module Math();
input [31:0] A, B;

output [31] Out;
reg sign; // Store the signed of num
reg [7:0] firstArea; // Store the 
reg [22:0] tailArea;


assign sign = A[31];
assign firstArea = A[30:23];
assign tailArea = A[22:0];

endmodule




/* Input output data use HEX code to show result
15.75=417C0000
3=40400000

15.75+3=18.75 = 41960000
15.75-3=12.75=414C0000
15.75*3=47.25=423D0000
15.75/3=5.25=40A80000*/