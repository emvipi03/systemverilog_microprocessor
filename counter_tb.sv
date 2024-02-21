module counter_tb;

  reg clk, reset, start, ud;
  reg [6:0] startValue;
  wire [6:0] HEX0, HEX1;

  counter uut (.*);

  initial begin
   
    clk = 0;
    reset = 1;
    start = 0;
    ud = 0;
    startValue = 8'b00000011;

	
    #10 reset = 0;

   
    #100 start = 1; // bat dau dem 
			
    #100 ud = 0; // dem len
    #500 start = 0; 
    #100 ud = 1; // dem xuong
    #500 start = 1; 
    #500 $finish;
  end

  
  always #5 clk = ~clk;

endmodule 