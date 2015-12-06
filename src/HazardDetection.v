module HazardDetectionUnit
(
	input	[4:0]	IDEXMr_i,
	input 	[4:0]	IDEXRt_i,
	input	[4:0]	IFIDRs_i,
	input	[4:0]	IFIDRt_i,
	output			IFIDwr_o,
	output			PCwr_o,
	output			stall,
	output			flush
);

assign IFIDwr_o =	(IDEXMr_i == 1 && IDEXRt_i == IFIDRs_i) ? 0:
					(IDEXRt_i == 1 && IDEXRt_i == IFIDRt_i) ? 0:
					1;

assign PCwr_o =		(IDEXMr_i == 1 && IDEXRt_i == IFIDRs_i) ? 0:
					(IDEXRt_i == 1 && IDEXRt_i == IFIDRt_i) ? 0:
					1;

assign stall =		(IDEXMr_i == 1 && IDEXRt_i == IFIDRs_i) ? 1:
					(IDEXRt_i == 1 && IDEXRt_i == IFIDRt_i) ? 1:
					0;

endmodule
