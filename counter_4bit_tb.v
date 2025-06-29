module counter_4bit_tb;

reg clk;
reg rst_n;
wire [3:0] q;

// Instantiate DUT (Device Under Test)
counter_4bit uut (
  .clk(clk),
  .rst_n(rst_n),
  .q(q)
);

// Clock generation: toggle every 5 time units (period = 10)
always begin
  clk = 0; #5;
  clk = 1; #5;
end

initial begin
  $monitor("Time=%0t | rst_n=%b | q=%b", $time, rst_n, q);

  // Initial conditions
  rst_n = 0; #12;    // Assert reset for a bit
  rst_n = 1;         // Release reset

  #100;              // Let it run for a while

  rst_n = 0; #10;    // Apply reset again
  rst_n = 1;         // Release reset

  #50;               // Run more

  $finish;
end

// For waveform
initial begin
  $dumpfile("counter_4bit.vcd");
  $dumpvars(0, counter_4bit_tb);
end

endmodule
