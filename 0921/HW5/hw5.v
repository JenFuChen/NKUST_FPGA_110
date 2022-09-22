module hw5(addr,CLK,res,data1);
input CLK,res;
output [3:0] addr;
output [3:0] data1;
reg [3:0] data1;
reg [3:0] addr;
always@(posedge CLK) 
begin
	if(res) 
	addr<=4'h0;
	else
	addr<=addr+1;
end
always @(addr) 
begin
	case ( addr )
	4'd0 : data1 = 4'h6 ;
	4'd1 : data1 = 4'h7 ;
	4'd2 : data1 = 4'h8 ;
	4'd3 : data1 = 4'h5 ;
	4'd4 : data1 = 4'h9 ;
	4'd5 : data1 = 4'h7 ;
	4'd6 : data1 = 4'h2 ;
	4'd7 : data1 = 4'h3 ;
	default: data1 = 4'h0;
	endcase
end
endmodule
