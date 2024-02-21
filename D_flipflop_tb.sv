module Latch_tb;

	logic S, R;
	logic Q;
	
	Latch DUT(.*);
	
	initial begin
	S = 0; R = 0;
	#10 S = 1;
	#10 R = 1;
	#10 S = 0;
	#10 R = 0;
	#10 $finish;
	end
endmodule 