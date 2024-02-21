module Moore_oc_tb;

	logic clk, reset,a;
	logic y;
	
	Moore_oc moore_oc (
    .clk(clk),
    .reset(reset),
    .a(a),
    .y(y)
  );
	
	initial begin 
	clk=0;
	forever #5 clk=~clk;
	end

  // Test sequence
  initial begin
    // Initialize
    reset = 1;
    a = 0;
    #10 reset = 0;
    
    // Test case 1
    a = 1;
    #20 a = 0;
    
    #20 a = 1;
	 #20 a = 1;
	 #20 a = 0;
	 #20 a = 0;
	 #20 a = 1;
    $finish;
  end
endmodule 