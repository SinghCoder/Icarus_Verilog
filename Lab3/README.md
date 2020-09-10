# Lab Sheet 3

## LearningObjectives

- Introduction to Sequential circuits
- Blocking and Non-Blocking Assignments
- Sequential and Parallel blocks
- Finite State Machine Implementation (Mealy Machine)
- 4-bit Shift Register Implementation

## Non blocking vs Blocking - Race Conditions

```verilog
    //Illustration 1: Two concurrent always blocks with blocking
    //statements
    always @(posedge clock)
        a = b;
    always @(posedge clock)
        b = a;
    //Illustration 2: Two concurrent always blocks with nonblocking
    //statements
    always @(posedge clock)
        a <= b;
    always @(posedge clock)
        b <= a;
```

- treat Non blocking as a sequence of 2 operations
  - firstly Read cycle happens
  - all the variables on the RHS are read and stored in temporary variables
  - At the positive edge of clock, the values of all right-hand-side  variables are "read," and the right-hand-side expressions are evaluated and stored in temporary variables.
  - During the write operation, the values  stored in the temporary  variables are assigned  to the left-hand-side variables
  - For above example, Separating the read and write operations ensures that the values of registers a and b are swapped correctly, regardless of the order in which the write operations are performed.

```verilog
//Process nonblocking assignments by using temporary variables
    always @(posedge clock) begin
        //read operation
        //store values of right-hand-side expressions in temporary variable:
        temp_a = a ; temp_b = b;
        //Write operation
        //Assign values of temporary variables to left-hand-side variables
        a = temp-b; b = temp-a ;
    end
```

- use of nonblocking assignments in place of blocking assignments is highly recommended  in places where concurrent data transfers take place after a common event
- In such cases, blocking assignments can potentially  cause race conditions because the final result depends on the order in which the assignments are evaluated.
- Nonblocking assignments can be used effectively to model concurrent data transfers  because the final result  is not dependent on the order in which the assignments are evaluated.
- Typical applications of nonblocking assignments include pipeline modeling and modeling of several mutually exclusive data transfers.
- On the downside, nonblocking assignments can potentially  cause a degradation in the simulator performance and increase in memory usage.

## Block Types

- There are two types of blocks: *sequential* blocks and *parallel* blocks

### Sequential

- The keywords **begin** and **end** are used to group statements into sequential blocks.
- The statements in a sequential block are processed in the order they are specified. A statement is executed  only after its preceding statement completes execution
- If delay or event control is specified, it is relative to the simulation time when the previous statement in the block completed execution

### Parallel

- specified by keywords **fork** and **join**
- Statements in a parallel block are executed concurrently
- Ordering of statements is controlled by the delay or event control assigned to each statemen
- If  delay or event control is specified, it is relative to the time the block was entered
- All statements in a parallel block start at the time when the block was entered. Thus, the order in which the statements are written  in the block is not important.
- Parallel blocks provide a mechanism to execute statements in parallel. However, it is important to be careful with parallel blocks because of implicit race conditions that might arise if two statements that affect the same variable complete at the same time

```verilog
    //Parallel blocks with deliberate race condition
    reg x, y; reg [1:0] z, w;
    initial
        fork
            x = 1'bO; y = 1'b1;
            z = {x,y};
            w = {y,x};
        join
```

- All statements start at simulation time 0.
- The order in which the statements will execute is not known.
- Variables z and W will get values 1 and 2 if X = l'bO and y = l'bl execute first.
- Variables z and W will get values 2'bxx and 2'bxx if X = l'bO and y = l'bl execute last. Thus, the result of z and W is nondeterministic and dependent on the simulator implementation