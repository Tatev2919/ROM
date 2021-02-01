module mem_tb;
	reg clk,read;
	reg  [3:0] address; 
	wire [7:0] d_out;
	
	integer i,file,feoff;
	reg [7:0] data;
	
	initial begin 
		$dumpfile("v.vcd");
		$dumpvars();
	end
	
	memory m1 (clk,read,d_out,address);

	initial begin
		clk = 1'b1;
		address = 1'b0;
		read = 1'b1;
		for ( i = 0; i < 15; i = i + 1) begin
			@(posedge clk);
			address <= address + 1;
		end
	        feoff = $feof(file);
		while (!feoff)
			@(posedge clk) read = 1'b1;
		read = 1'b0;
		#5000;
		$finish;
	end

	always #10 clk = ~clk;

	initial begin
		data = 0;
		file = $fopen("faults.txt");
		while(data < 16) begin
			$fdisplayb(file,"",data);
			data = data + 1;
		end
		$fclose(file); 
	end

endmodule
