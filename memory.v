module memory(clk,read,d_out,address);
input      clk,read;
input      [3:0] address; 
output reg [7:0] d_out;

reg [7:0] data_ROM [15:0];

initial $readmemb("faults.txt",data_ROM);

always @(posedge clk) begin
	if (read) begin
		d_out <= data_ROM[address]; 
	end
end

endmodule 
