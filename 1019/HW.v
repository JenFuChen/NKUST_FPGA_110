module HW(en,d1,d2,sel,dout);
input [3:0]d1,d2;
input en,sel;
output [7:0]dout;
reg [7:0]dout;
reg [7:0]R;
integer i;
always@(en)begin
    if(!en)
        dout <= 8'hz;
    else    begin
        if(!sel) begin
           dout = 8'h0;
            for(i=4;i>0;i=i-1)begin
            dout = dout << 1;
            if(d2[i-1]==1)begin
                dout =dout+d1;
            end
            else
                dout = dout ;
            end
        end
        else     begin 
            R = d2;
            R = R << 1;
            for(i=0;i<4;i=i+1)begin
                R[7:4]= R[7:4]-d1;
                if(R[7]==1)begin
                    R[7:4]=R[7:4]+d1;
                    R= R << 1;
                end
                else begin 
                    R[7:4]=R[7:4];
                    R=R << 1;
                    R= R+1;
                end
            end
            dout[7:4] = R[7:4]>>1;
            dout[3:0] = R[3:0];
        end
    end
end
endmodule