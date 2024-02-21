module carrylookahead_tb;
  reg [3:0]A, B; 
  reg Cin;
  wire [3:0] S;
  wire Cout;
  wire[4:0] add;
  
  carrylookahead cla(A, B, Cin, S, Cout);
  
  initial begin
    A = 4'b1011;
	 B = 4'b0110;
	 Cin = 0;
  end
endmodule