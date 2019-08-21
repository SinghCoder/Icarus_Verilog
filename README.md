# Verilog Snippets and Notes
A host for some Verilog-snippets written during Lab Sessions of **Computer Architecture** Course at **BITS Pilani**.

## Running a file 

- Compile the verilog file (one with.v extension) using following command
```verilog
iverilog -o filename.vvp filename.v
```
- To see output using $monitor statements run following command
```verilog
vvp filename.vvp
```
- To get graphical waveform output, make sure to add following lines in every test branch
```verilog
initial
    begin
        $dumpfile("filename.vcd");
        $dumpvars;
    end
```

- To see graphical waveform output
```verilog
gtkwave filename.vcd
```

- To include a header file in your program
```verilog
`include "modulename.v"
```

### **Most Common Mistakes in Verilog**
1. All keywords should be in lower case.  
2. Upper case and lower case are distinct in verilog, it is case sensitive  
3. Make sure that the wires are properly declared before usage.  
4. Unwanted spaces will put you in trouble ex. endmodule doesn’t have any space in between.
5. Module declaration is a statement terminate it with a semicolon.  
6. Module name can’t start with a number and can’t have a special charcters in it.  
7. The output ‘x’ indicates that the signal is still unkown and being evaluated.  
8. In combinational circuits ‘z’ in the output means the signals are not connected properly.

### References :
1. *Verilog HDL by Samir Palnitkar*