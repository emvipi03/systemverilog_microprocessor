module FullAdder (
  input logic a,
  input logic b,
  input logic cin,
  output logic sum,
  output logic cout
);

  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (cin & a);

endmodule

module rippercarryadder (
  input logic [3:0] A,
  input logic [3:0] B,
  input logic cin0,
  output logic [3:0] sum,
  output logic cout
);

  logic [3:0] carry;

  FullAdder FA0 (.a(A[0]), .b(B[0]), .cin(cin0), .sum(sum[0]), .cout(carry[0]));
  FullAdder FA1 (.a(A[1]), .b(B[1]), .cin(carry[0]), .sum(sum[1]), .cout(carry[1]));
  FullAdder FA2 (.a(A[2]), .b(B[2]), .cin(carry[1]), .sum(sum[2]), .cout(carry[2]));
  FullAdder FA3 (.a(A[3]), .b(B[3]), .cin(carry[2]), .sum(sum[3]), .cout(cout));

endmodule 