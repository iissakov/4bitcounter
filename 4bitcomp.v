module four_comp(
	input [3:0] a,
	input [3:0] b,
	
	input		great,
	input		equal,
	input		less,
	
	output		L,
	output		EQ,
	output		G
);

//Wires used for connecting single_comp instantiations
wire	g_0;
wire	g_1;
wire	g_2;

wire	eq_0;
wire	eq_1;
wire	eq_2;

wire	l_0;
wire	l_1;
wire	l_2;

//Single comp instatiations
single_comp single_comp_0(
	.a		(a[0]),
	.b		(b[0]),
	.great	(great),
	.equal	(equal),
	.less	(less),
	.G		(g_0),
	.EQ		(eq_0),
	.L		(l_0)
);

single_comp single_comp_1(
	.a		(a[1]),
	.b		(b[1]),
	.great	(g_0),
	.equal	(eq_0),
	.less	(l_0)
	.G		(g_1),
	.EQ		(eq_1),
	.L		(l_1)
);

single_comp single_comp_2(
	.a		(a[2]),
	.b		(b[2]),
	.great	(g_1),
	.equal	(eq_1),
	.less	(l_1)
	.G		(g_2),
	.EQ		(eq_2),
	.L		(l_2)
);

single_comp single_comp_3(
	.a		(a[3]),
	.b		(b[3]),
	.great	(g_2),
	.equal	(eq_2),
	.less	(l_2)
	.G		(G),
	.EQ		(EQ),
	.L		(L)
);

endmodule

module single_comp(
	input a,
	input b,
	input great,
	input equal,
	input less,
	
	output G,
	output EQ,
	output L
);

//Combo block for 1-bit comparator logic
always @(*)
begin
	if (a > b) begin
		L = 0;
		EQ = 0;
		G = 1'b1;
	end
	else if (a == b) begin
		if (great) begin
			L = 0;
			EQ = 0;
			G = 1'b1;
	    end
		else (less) begin
			L = 1'b1;
			EQ = 0;
			G = 0;
	    end
		else (equal) begin
			L = 0;
			EQ = 1'b1;
			G = 0;
		end
	else if (a < b) begin
		L = 1'b1;
		EQ = 0;
		G = 0;
	end
end

endmodule