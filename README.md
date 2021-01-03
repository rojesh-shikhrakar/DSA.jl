# DSA.jl: Courseware on Data Structure and Algorithms
DSA.jl holds jupyter and pluto notebooks, source codes and example data files to teach DSA in Julia.

Algorithm is a well-defined outline or a finite set of sequential steps of a computational procedure to solve a class of problems. 
Starting from a specified inital state or "input", the procedure decribes computations on the state that transitions through a finite number of well-defined successive states, eventually producing a specified "output" and terminating at a final ending state.
A computer program is an implementation of the algorithm in some programming language. Here, I have used Julia Programming language.
Data Structure is the organisation of the data needed to solve the problem.

The choice of Algorithm and Data Structure
- helps improve space and runtime efficiency, and eventually scalability
- allows rapid prototyping to solve problem with simplicity and user friendliness

## Usage Guidelines
This is also a tutorial on different packages for DSA available in Julia as well as on DSA itself. It consist of two types of notebooks

### Jupyter Notebooks 
To run the tutorials interactively via Jupyter notebooks, install the package and open the tutorials like:
```
using Pkg
pkg"add https://github.com/rojesh-shikhrakar/DSA.jl"
using IJulia
notebook()
```

### Pluto Notebooks
```
using Pkg
pkg"add https://github.com/rojesh-shikhrakar/DSA.jl"
using Pluto
Pluto.run()
```

## Table of Contents
- Introduction to DSA
  - Algorithms
  - Asymptotic Analysis
- Arrays and Linked List
  - Arrays
  - Linked Lists
- Maps and Hashing
- Recursive Algorithms
- Trees
- Graphs
- Search and Sort Algorithms
- Numeric Algorithms
  - Integer Arthimetics
  - Numeric Methods
- Randomized Algorithms
- Incremental and Online Algorithms
- Dynamic Programming
- Optimization Algorithms
- Linear Programming
- Distributed Algorithms



## Contribution Guidelines
- Make appropriately sized changes: Neither too large nor too small.
- Appropriately format the contents
