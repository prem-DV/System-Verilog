class sample;
	rand bit[7:0] addr;

	extern constraint addr_c;

	extern function void post_randomize();
endclass

function void sample::post_randomize();
	$display("addr = %0d",addr);
endfunction

constraint sample::addr_c{
	addr[0] == 0;
}

module top;
	sample s;

	initial begin
		s = new();
		repeat(4) begin
			assert(s.randomize());
		end
	end
endmodule
