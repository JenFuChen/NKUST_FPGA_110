module HW4(CLK,up,count,RST,a,L);
input CLK,up,RST,L ;
input [3:0]a;
output [3:0] count;
reg [3:0] count;
always@(posedge CLK)
begin
	if(!RST) 
	begin
		if(L)
			count=a;
		else
		begin
			if(!up)	// if up = 0  count down
			begin
				if(count == 4'b0000)
					count <= 4'b1111;
				else
					count<=count- 1;
			end
			else 		// if up = 1 count up
			begin
				if(count == 4'b1111)
					count <= 4'b0000;
				else
					count<=count+ 1;
			end
		end
	end
	else
		begin
			if(up == 1)
				count <= 4'b0000;
			else
				count <= 4'b1111;
		end
end
endmodule