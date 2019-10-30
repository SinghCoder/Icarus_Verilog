`include "adder_32bit.v"

module testbench_adder_32bit;
	 reg [31:0] num1,num2;
	 wire [31:0] sum;
	 wire cfinal;
	 wire cin;
	 
	 assign cin = 0;
	 
	 adder_32bit add1(cfinal,sum,num1,num2,cin);
	 initial
		$monitor(,$time,"sum=%b, cfinal = %b, num1=%b, num2=%b, cin = %b",sum,cfinal,num1,num2,cin);
	 
	 initial
		 begin
			#0  num1=32'b00000001000000010000000100000001;num2=32'b11111111111111111111111111111111;
			#10 num1=32'b00000000000000000000000000000000;num2=32'b11111110111111101111111011111110;
			#20 num1=32'b00000000000000000000000000000000;num2=32'b11111101111111011111110111111101;
			#30 num1=32'b00000000000000000000000000000000;num2=32'b11111011111110111111101111111011;
			#40 num1=32'b00000000000000000000000000000000;num2=32'b11110111111101111111011111110111;
		 end
endmodule