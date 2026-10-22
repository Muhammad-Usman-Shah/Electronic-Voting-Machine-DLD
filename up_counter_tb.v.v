// Testbench for the 4 bit up counter
// It makes a clock, holds reset for a short time and then lets the counter run.

module upcounter_testbench();

// Inputs we drive and the output we watch.
reg clk, reset;
wire [3:0] counter;

// Connect the counter we want to test.
up_counter dut(clk, reset, counter);

// Clock generator.
// It flips every 5 time units, so one full cycle takes 10.
initial begin
clk=0;
forever #5 clk=~clk;
end

// Reset sequence.
// Reset stays high for 20 time units, then goes low and the counting starts.
initial begin
reset=1;
#20;
reset=0;
end

// Save the signals so a waveform viewer can open them.
// Stop at 270 time units, which is the same length as the waveform in the report.
initial begin
$dumpfile("up_counter.vcd");
$dumpvars(0, upcounter_testbench);
#270;
$finish;
end

endmodule
