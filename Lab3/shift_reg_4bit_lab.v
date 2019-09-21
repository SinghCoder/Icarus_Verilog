module shift_reg_4bit_lab( in, en, Q, clk );

    parameter n = 4;
    input in, en, clk;
    output [n-1:0] Q;
    reg [n-1:0] Q;

    initial 
        Q = 4'd10;
    
    always @(posedge clk) begin
        if(en)
        begin
            Q = {in, Q[n-1:1]};
        end
    end
endmodule