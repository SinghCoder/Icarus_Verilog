`define S0 2'b00
`define S1 2'b01
`define S2 2'b10
`define S3 2'b11

module bht(
    output [1:0] outp,
    input [1:0] inp,
    input [9:0] address,
    input write
);
    wire [1:0] outp;
    integer i;
    reg [1:0] bhtTable [0:1023];
    initial begin
        for(i = 0; i < 1024; i = i+1) begin
            bhtTable[i] = 2'b0;
        end
    end
    
    assign outp = bhtTable[address];

    always @(write)
        if(write == 1)
            bhtTable[address] = inp;

endmodule

module mux(
    output [1:0] outp,
    input [1:0] inp1,
    input [1:0] inp2,
    input sel
);
    
    reg [1:0] outp;
    always @* begin
        if(sel)
            outp = inp2;
        else
            outp = inp1;
    end

endmodule

module predictor(
    output [1:0] outpState,
    input actOutcome,
    input clock
);

    reg [1:0] machineState, outpState;

    initial 
        machineState = `S0;
    
    always @(posedge clock) begin
        case({machineState,actOutcome}) 

            {`S0,1'b0} :   machineState = `S0;
            {`S0,1'b1} :   machineState = `S1;

            {`S1,1'b0} :   machineState = `S0;
            {`S1,1'b1} :   machineState = `S3;

            {`S2,1'b0} :   machineState = `S0;
            {`S2,1'b1} :   machineState = `S3;

            {`S3,1'b0} :   machineState = `S2;
            {`S3,1'b1} :   machineState = `S3;

            default :   machineState = `S0;
        endcase

        outpState = machineState;
    end

endmodule

module intg(
    output prevPredn,
    input [9:0] address,
    input actOutcome,
    input clock
);
    reg prevPredn;
    initial 
        prevPredn = 1'b0;
    
    wire [1:0] bhtOut1, bhtOut2;
    wire [1:0] nextState;
    wire [1:0] branchPredn;

    wire writeBht1, writeBht2;

    assign writeBht2 = ~writeBht1;

    assign writeBht1 = ~actOutcome;

    bht bht1(.outp(bhtOut1), .inp(nextState), .address(address), .write(writeBht1));
    bht bht2(.outp(bhtOut2), .inp(nextState), .address(address), .write(writeBht2));

    mux mux1(.outp(branchPredn), .inp1(bhtOut1), .inp2(bhtOut2), .sel(prevPredn));
    predictor p1(.outpState(nextState), .actOutcome(actOutcome), .clock(clock));

    always @(branchPredn) begin
        case (branchPredn)

            `S0 : begin
                    $display("Not taken");
                    prevPredn = 1'b0;
                  end

            `S1 : begin
                    $display("Not taken");
                    prevPredn = 1'b0;
                  end

            `S2 : begin
                    $display("Taken");
                    prevPredn = 1'b1;
                  end

            `S3 : begin
                    $display("Taken");
                    prevPredn = 1'b1;
                  end


        default  : begin
                    $display("Not taken");
                    prevPredn = 1'b0;
                  end
        endcase

    end

endmodule

module tb_intg();   
    
    initial begin
        $dumpfile("file.vcd");
        $dumpvars;
    end

    reg [9:0] address;
    wire prediction;
    reg  actualOutcome;
    reg clock;

    initial begin
        clock = 1'b0;
        actualOutcome = 1'b0;
    end
    
    always
        #5 clock = ~clock;
    
    intg mod(prediction, address, actualOutcome, clock);

    initial begin
            address = 10'b0011110000;
        #10  actualOutcome = 1'b0;
        #10  actualOutcome = 1'b1;
        #10  actualOutcome = 1'b1;
        #10  actualOutcome = 1'b1;
        #10  actualOutcome = 1'b0;
        #10  $finish;
    end

endmodule