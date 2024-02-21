module counter (
  input logic clk,              
  input logic reset,            
  input logic start,            
  input logic ud,               
  input logic [6:0] startValue, 
  output logic [6:0] HEX0,       
  output logic [6:0]  HEX1        
);

reg [6:0] count;  

always @(posedge clk or posedge reset) begin
	
	// đặt giá trị đếm bắt đầu khi nhấn reset
	if (reset) begin
		count <= startValue; 
	end
	else if (start == 1) begin
		count <= startValue; 
	if (ud == 0) begin 
		if(count == 7'b1100011) begin // neu dem toi 99 thi ve 0
			count <= 7'b0;
		end
		
		else begin
			count <= count + 7'b0000001; // đếm tiến
		end
		
	end else begin
		if(count == 7'b0000000) begin // neu dem toi 0 thi ve 99
			count <= 7'b1100011;
		end
		
		else begin
			count <= count - 7'b0000001; // đếm lùi
			end
		end
	end
end

// tach chu so

assign HEX0 = count % 10;
assign HEX1 = (count / 10) % 10;

endmodule