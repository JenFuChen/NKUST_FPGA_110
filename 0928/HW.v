module HW(clk, rst, do0, do1, do2, count, di0, mo);
    input clk ;
    input rst ;

    localparam  dSize = 10;
    wire [dSize-1:0] m1[0:8];
    wire [dSize-1:0] m2[0:8];

    wire [dSize-1:0] a1[0:8];
    wire [dSize-1:0] a2[0:8];

    output [dSize*3*3-1:0] mo ;
    output [dSize*3-1:0] di0 ;

    output reg [6:0] count = 0;
    always @(posedge clk, posedge rst) begin
        if (rst)
            count <= 0;
        else if (count == 10)
            count <= 0;
        else
            count = count + 6'd1;
    end

    output [dSize-1:0] do0;
    output [dSize-1:0] do1;
    output [dSize-1:0] do2;

    reg [dSize-1:0] d0[0:2];
    reg [dSize-1:0] d1[0:2];
    reg [dSize-1:0] d2[0:2];

    assign di0 = { d0[2],d0[1],d0[0] };

    matrix #(.lSize(3), .dSize(dSize)) ma0(clk, rst, { d0[0],d0[1],d0[2] }, do0, mo);
    matrix #(.lSize(3), .dSize(dSize)) ma1(clk, rst, { d1[0],d1[1],d1[2] }, do1);
    matrix #(.lSize(3), .dSize(dSize)) ma2(clk, rst, { d2[0],d2[1],d2[2] }, do2);

    wire [6:0] data[0:50];
    generate
        genvar  i6 ;
        for ( i6 = 0; i6 < 50 ; i6 = i6 + 1) begin :rom
            assign data[i6] = i6+1;
        end
    endgenerate

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            d0[0] <= 0;
            d0[1] <= 0;
            d0[2] <= 0;

            d1[0] <= 0;
            d1[1] <= 0;
            d1[2] <= 0;

            d2[0] <= 0;
            d2[1] <= 0;
            d2[2] <= 0;
        end else     begin
            d0[0] <= data[count     ];
            d0[1] <= data[count + 10];
            d0[2] <= data[count + 20];

            d1[0] <= data[count + 10];
            d1[1] <= data[count + 20];
            d1[2] <= data[count + 30];

            d2[0] <= data[count + 20];
            d2[1] <= data[count + 30];
            d2[2] <= data[count + 40];
        end
    end

endmodule

module matrix  ( clk, rst, ds, dOut, mo);
    parameter lSize = 3;
    parameter dSize = 3;

    input clk;
    input rst;
    input [0:dSize*lSize-1] ds;
    output [dSize-1:0] dOut ;

    reg [dSize-1:0] m[0:(lSize*lSize)-1];
    wire [dSize-1:0] a[0:(lSize*lSize)-1];

    output [dSize*lSize*lSize-1:0] mo ;
    assign mo = {m[8], m[7], m[6], m[5], m[4], m[3], m[2],m[1], m[0]};

    unit #(.dSize(dSize), .h(10'd4)) u0(m[0], 10'd0,a[0]);
    unit #(.dSize(dSize), .h(10'd4)) u1(m[1], a[0] ,a[1]);
    unit #(.dSize(dSize), .h(10'd4)) u2(m[2], a[1] ,a[2]);

    unit #(.dSize(dSize), .h(10'd3)) u3(m[3], a[2] ,a[3]);
    unit #(.dSize(dSize), .h(10'd3)) u4(m[4], a[3] ,a[4]);
    unit #(.dSize(dSize), .h(10'd3)) u5(m[5], a[4] ,a[5]);

    unit #(.dSize(dSize), .h(10'd2)) u6(m[6], a[5] ,a[6]);
    unit #(.dSize(dSize), .h(10'd2)) u7(m[7], a[6] ,a[7]);
    unit #(.dSize(dSize), .h(10'd2)) u8(m[8], a[7] ,a[8]);

    wire [dSize-1:0] d[0:lSize-1];
    generate
        genvar  i0 ;
        for ( i0 = 0; i0 < lSize; i0 = i0 + 1) begin :N
            assign d[i0] = ds[dSize*i0 : dSize*(i0+1)-1];
        end
    endgenerate


    always @(posedge clk, posedge rst) begin
        if (rst) begin
            integer i2;
            for ( i2 = 0; i2 < (lSize*lSize) ; i2 = i2 + 1)
                m[i2] <= 0;
        end else begin
            integer i4;
            integer i3;
            for ( i3 = 0; i3 < lSize ; i3 = i3 + 1)
            m[i3] <= d[i3];
            for ( i4 = lSize; i4 < (lSize*lSize) ; i4 = i4 + 1)
            m[i4] <= m[i4-lSize];



            //m[8] <= m[5];
            //m[7] <= m[4];
            //m[6] <= m[3];
            //m[5] <= m[2];
            //m[4] <= m[1];
            //m[3] <= m[0];

            //m[2] <= d[2];
            //m[1] <= d[1];
            //m[0] <= d[0];
        end
    end

    assign dOut = a[(lSize*lSize)-1];

endmodule


module unit (dIn, aIn, aOut);
    parameter dSize = 3;
    parameter h = 1;

    input [dSize-1 :0] dIn;
    input [dSize-1 :0] aIn;
    output [dSize-1 :0] aOut;

    wire [dSize-1:0] snap;
    assign snap = dIn * h;
    assign aOut = aIn + snap;
endmodule

