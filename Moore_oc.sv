module Moore_oc (
	input logic clk,
	input logic reset,
	input logic a,
	output logic y);
	
typedef enum logic [1:0] {S0 = 2'b00, S1 = 2'b01, S2 = 2'b10} statetype;
statetype state, nextstate;
//state resgister
always_ff @(posedge clk, posedge reset)
	if (reset) state <= S0;
	else state <= nextstate;
// nextstate logic
	always_comb
		case (state)
		S0: if (a) nextstate = S0;
		else nextstate = S1;
		S1: if (a) nextstate = S2;
		else nextstate = S1;
		S2: if (a) nextstate = S0;
		else nextstate = S1;
		default: nextstate = S0;
		endcase 
// output logic
assign y = (state==S2);
endmodule 