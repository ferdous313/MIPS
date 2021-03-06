module Registers #(parameter width=32, size=32) (
    input					clk,
	input		[4:0]		Rs_addr, Rt_addr,
	output reg	[width-1:0]	Rs_data, Rt_data,
	input					we,
	input		[4:0]		Rd_addr,
	input		[width-1:0]	Rd_data
);
	
	integer i;

	// Register File
	reg     [31:0]      register        [0:31];

	// Initialize the register files.
	initial begin
		for(i = 0; i < size; i = i+1)
			register[i] = {width{1'b0}};
	end
	
	// Read data from the register files.    
	always @ (posedge clk) begin  
		Rs_data <= register[Rs_addr];
		Rt_data <= register[Rt_addr];
	end

	// Write data to the register files.   
	always @ (posedge clk) begin
    	if(we)
    	    register[Rd_addr] = Rd_data;
	end
   
endmodule 
