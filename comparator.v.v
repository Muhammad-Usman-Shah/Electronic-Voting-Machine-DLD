// 4 bit comparator
// Used in the voting machine to find out which candidate has more votes.
// Exactly one of the three outputs is high at any time.
//   eq is high when a equals b
//   gt is high when a is greater than b
//   lt is high when a is less than b

module comparator(a,b,eq,lt,gt);

// The two 4 bit numbers we compare.
input [3:0] a,b;

// The three result flags.
output reg eq,lt,gt;

// Run again whenever a or b changes.
always @(a,b)
begin
 // Same votes, so it is a tie.
 if (a==b)
 begin
  eq = 1'b1;
  lt = 1'b0;
  gt = 1'b0;
 end
 // a has more votes.
 else if (a>b)
 begin
  eq = 1'b0;
  lt = 1'b0;
  gt = 1'b1;
 end
 // Anything left means a has fewer votes.
 else
 begin
  eq = 1'b0;
  lt = 1'b1;
  gt = 1'b0;
 end
end
endmodule
