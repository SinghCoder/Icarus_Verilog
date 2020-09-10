# Practice Questions

For the following questions, write the errors/warnings in the code.

1. Question 1

    ```verilog
         module bitwise_or(a, b, c);
             input[3:0] a,b;
             output[3:0] c;
             reg [3:0] c;
             assign c = a | b;
         endmodule
    ```

2. Question 2

    ```verilog
        module and_gate(ina, inb, out);
            input ina;
            input inb;
            output out;
            always @(ina or inb)
               begin
                    if(ina == 1)
                        out = inb;
                    else
                        out = ina;
               end
        endmodule
    ```

3. Question 3

    ```verilog
        module or_gate(ina, inb, out);
            input ina;
            input inb;
            output out;
            if(ina == 1)
               out = 1;
            else
               out = inb;
        endmodule
    ```

4. Question 4

    ```verilog
        module adder(ina, inb, out);
             input [3:0] ina;
             input [3:0] inb;
             output [3:0] out;
             out = ina + inb;
        endmodule

        module tb_test();
            reg a, b, c;
            adder (a, b, c);
            initial
                 begin
                     #0 a = 4'b0000; b = 4'b0001;
                     #5 a = 4'b0010; b = 4'b0001;
                     #10 a = 4'b1111; b = 4'b0001;
                     #15 $finish;
                 end

            $monitor("a = %b, b = %b, c = %b", a, b, c);
        endmodule
    ```