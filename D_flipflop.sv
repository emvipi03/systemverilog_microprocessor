module Latch (
	input logic D,
	output logic Q
);

	always @(S,R)
begin 
	if (S && !R)
		Q <= 1'b1;
	else if(!S && R)
		Q <= 1'b0;
	else if (S && R)
		Q <= 1'b0;
	else Q <= Q;
	end
endmodule 