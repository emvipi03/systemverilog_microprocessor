module Thunderbird (
	input logic clk,
	input logic reset,
	input logic left,
	input logic right,
	output logic la,
	output logic lb,
	output logic lc,
	output logic ra,
	output logic rb,
	output logic rc
);
typedef enum logic [2:0] {S0=3'b000, S1=3'b001, S2=3'b010,
			S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110} statetype;
	
statetype state, nextstate;

always_ff @(posedge clk, posedge reset)
		if (reset) state <= S0;
		else state <= nextstate;

always_comb 
	case(state)
	S0: if (left&~right) nextstate=S1;
		else if(right&~left) nextstate=S4;
	S1: nextstate=S2;
	S2: nextstate=S3;
	S3: nextstate=S0;
	S4: nextstate=S5;
	S5: nextstate=S6;
	S6: nextstate=S0;
	endcase
	
assign la=S1|S2|S3;
assign lb=S2|S3;
assign lc=S3;

assign ra=S4|S5|S6;
assign rb=S5|S6;
assign rc=S6;

endmodule