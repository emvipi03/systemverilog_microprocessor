module rippercarryadder_tb;

// Inputs
  logic [3:0] A, B;
  logic cin0;
  // Outputs
  logic [3:0] sum;
  logic cout;

  // Instantiate the FourBitRippleCarryAdder module
  rippercarryadder S (
    .A(A),
    .B(B),
	 .cin0(cin0),
    .sum(sum),
    .cout(cout)
  );

  // Stimulus
  initial begin
    A = 4'b0110;
    B = 4'b1011;
	 cin0 = 1'b0;

    #100;

  end

endmodule