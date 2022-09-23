module hw1(CLK,en,count,rst);
input CLK,en,rst; // reset 
output [3:0] count; 
reg [3:0] count; 


always@(posedge CLK)
begin 
if(rst)
	count <= 4'h0;
else
	begin
		if(!en) 
			count <= 4'hff; //nonblocking 
		else 
			count <= count- 1;
		end 
	end
	
endmodule

