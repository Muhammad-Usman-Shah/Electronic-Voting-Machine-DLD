// 4 bit up counter with reset
// Used in the voting machine to count the votes for one candidate.
// The count goes from 0 to 15 and then wraps back to 0.

module up_counter(input clk, reset, output[3:0] counter
    );

// This register holds the current count.
reg [3:0] counter_up;

// Count up by one on every rising clock edge.
// A rising edge on reset clears the count straight away.
always @(posedge clk or posedge reset)
begin
if(reset)
 counter_up <= 4'd0;
else
 counter_up <= counter_up + 4'd1;
end

// Send the stored count to the output pins.
assign counter = counter_up;
endmodule
