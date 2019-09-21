// module d flip flop with synchronus clear
// clock is negative edge triggered and clear signal is active low
module dff_async_clear(d,clearb, clock, q);
	input d, clearb, clock;
	output q;
	reg q;
	
	always @(negedge clock or negedge clearb)
		begin
			if(clearb)
				q = d;
			else
				q = 1'b0;
		end
endmodule