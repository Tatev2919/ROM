module mem_tb;
	reg clk,read;
	reg  [3:0] address; 
	wire [3:0] d_out;
	integer i; 
	initial begin 
		$dumpfile("v.vcd");
		$dumpvars();
	end
	
	memory m1 (clk,read,d_out,address);

	initial begin
		clk = 1'b1;
		read = 1'b1;
		address = 1'b0;
		for ( i = 0; i < 15; i = i + 1) begin
			@(posedge clk);
			address <= address + 1;
		end
		read = 1'b0;
		#5000;
		$finish;
	end
	always #10 clk = ~clk;
endmodule
