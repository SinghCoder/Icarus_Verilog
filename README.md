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

## Most Common Mistakes in Verilog

1. All keywords should be in lower case.  
2. Upper case and lower case are distinct in verilog, it is case sensitive  
3. Make sure that the wires are properly declared before usage.  
4. Unwanted spaces will put you in trouble ex. endmodule doesn’t have any space in between.
5. Module declaration is a statement terminate it with a semicolon.  
6. Module name can’t start with a number and can’t have a special charcters in it.  
7. The output ‘x’ indicates that the signal is still unkown and being evaluated.  
8. In combinational circuits ‘z’ in the output means the signals are not connected properly.

## Labs Breakdown

| Lab# | Labsheet                                                 | notes                  | topic                          |
| ---- | -------------------------------------------------------- | ---------------------- | ------------------------------ |
| 1    | [link](Lab1/Lab1_Sheet.pdf)                              | [link](Lab1/README.md) | Intro to verilog               |
| 2    | [link](Lab2/Lab_Sheet_2_Final.pdf)                       | [link](Lab2/README.md) | Combinational Circuit Modeling |
| 3    | [link](Lab3/Lab_Sheet_3_Final.pdf)                       | [link](Lab3/README.md) | Sequential Circuit Modeling    |
| 4    | [link](Lab4/Lab4_sheet_aludesign.pdf)                    | [link](Lab4/README.md) | ALU Design                     |
| 5    | [link](Lab5/Lab5_sheet_registerfile.pdf)                 | [link](Lab5/README.md) | Register File Implementation   |
| 6    | [link](Lab6/Lab_Sheet_6_Single_Cycle_Datapath_Final.pdf) | [link](Lab6/README.md) | Single Cycle Datapath Design   |
| 7    | [link](Lab7/LabSheet7.pdf)                               | [link](Lab7/README.md) | Multi-Cycle controller Design  |
| 8    | [link](Lab8/Lab_Sheet_8_Pipeline_DesignF.pdf)            | [link](Lab8/README.md) | Pipeline Design                |

## References

1. *Verilog HDL by Samir Palnitkar*

## Warning

- *The codes are not guaranteed to be correct and have not been verified thouroughly, if you find a mistake please feel free to send a PR or contact me via mail.*
- *All files on this repository are for educational purpose with no intentions of promoting unfair means in any evaluative component*
