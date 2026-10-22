// Testbench for the 4 bit comparator
// It tries four pairs of numbers and checks each result in the waveform.

module comparator_tst;

// Inputs we drive and the outputs we watch.
  reg [3:0] a,b;
  wire eq,lt,gt;

  // Connect the comparator we want to test.
  comparator DUT (a,b,eq,lt,gt);

  initial
  begin
   // Save the signals so a waveform viewer can open them.
   $dumpfile("comparator.vcd");
   $dumpvars(0, comparator_tst);

   // Test 1: both numbers are equal, so eq should be high.
   a = 4'b1100;
   b = 4'b1100;
   #10;

   // Test 2: a is smaller, so lt should be high.
   a = 4'b0100;
   b = 4'b1100;
   #10;

   // Test 3: a is bigger, so gt should be high.
   a = 4'b1111;
   b = 4'b1100;
   #10;

   // Test 4: both numbers are zero, so eq should be high again.
   a = 4'b0000;
   b = 4'b0000;
   #10;

   // End the simulation.
   $finish;
  end
endmodule
