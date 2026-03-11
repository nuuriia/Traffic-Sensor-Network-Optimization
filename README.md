# Traffic Sensor Network Optimization - L'Eixample (Barcelona)

This project was developed for the course **Optimització** in the Bachelor’s Degree in Artificial Intelligence at **FIB (UPC)**. It focuses on solving a complex location-allocation problem using **Mixed-Integer Linear Programming (MILP)** to design an efficient vehicle detection network in the urban grid of Barcelona.

The primary goal is to maximize the captured vehicle flow in the Eixample district, ensuring that sensor placement follows technical requirements, budget limits, and signal interference constraints.

## Project Description
Using real-world traffic data (paths and flows) from Barcelona, this project models a sensor network where a path is only considered "monitored" if at least **two** of its intersections are equipped with a sensor. The optimization is carried out in two distinct phases:

1.  **Phase A (Base Model):** Maximizing flow detection under a fixed budget (15 sensors) and predefined operational constraints (fixed and prohibited locations).
2.  **Phase B (Technical Constraints):** Incorporating a **minimum distance constraint** (300 meters) between sensors to prevent signal overlap and interference, modeled through neighborhood edge sets.

## Key Components
* **Mathematical Formulation:** Definition of decision variables (binary), objective functions for flow maximization, and linear constraints.
* **Combinatorial Optimization:** Implementation of logic to ensure a path is detected only when the sum of sensors on its nodes is $\ge 2$.
* **Spatial Constraints:** Handling prohibited zones and ensuring minimum separation between active nodes.
* **Solver Performance:** Analysis of optimality gaps and execution times using different optimization engines.

## Technical Structure
The project is implemented in **AMPL** (A Mathematical Programming Language) and is organized as follows:
* **`practica.mod` / `2.mod`**: Model files containing the algebraic formulation and constraints.
* **`practica.dat` / `2.dat`**: Data files containing the intersection sets, paths, traffic flows, and distance-based neighborhood edges.
* **`practica.run` / `2.run`**: Script files to automate the loading, solving, and result display process.
* **`informe practica 2 modelització.pdf`**: Final technical report containing the mathematical proofs, implementation details, and result analysis.

## How to Use
### Software Requirements
* **AMPL**: Standard or Student version.
* **Solvers**: [CBC](https://github.com/coin-or/Cbc) (Open source) or [Gurobi](https://www.gurobi.com/) (Recommended for Phase B).
* **NEOS Server**: Recommended for solving Phase B if the local license exceeds the variable/constraint limit.

### Execution
1.  Open your AMPL console.
2.  To run the base model, execute:
    ```ampl
    include practica.run;
    ```
3.  To run the model with distance constraints, execute:
    ```ampl
    include 2.run;
    ```

## Results
The optimization successfully identified the critical intersections to monitor. While the base model achieved a total captured flow of **~350.73**, the inclusion of the 300m safety distance in Phase B resulted in a negligible decrease in flow (**~350.18**), proving that a technically robust network can be achieved without sacrificing significant detection capacity.

## Authors
* **Mariona Casasnovas Simón**
* **Núria López Encinas**
