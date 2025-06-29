module counter_4bit (
  input clk,
  input rst_n,      // active-low reset
  output reg [3:0] q
);

always @(posedge clk or negedge rst_n) begin
  if (!rst_n)
    q <= 4'b0000;   // Reset counter to 0
  else
    q <= q + 1;     // Increment counter
end

endmodule
