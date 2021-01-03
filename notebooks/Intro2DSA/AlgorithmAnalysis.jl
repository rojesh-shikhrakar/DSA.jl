### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 2940cb92-4d76-11eb-3628-493a998f3033
using BenchmarkTools

# ╔═╡ bdb2792e-4d71-11eb-1c5b-03e16bad7067
md"""
# Analysis of Algorithms
Theoretical Study of Program Performance and Resources Usage

**What is more important that Performance ?**
"""

# ╔═╡ 0a158d10-4d72-11eb-3bf5-0ff33f2b9b9d
begin
	hint(text) = Markdown.MD(Markdown.Admonition("hint", "Hint", [text]))
	hint(md"""
	- Correctness
	- Simplicity
	- Maintainability: Modularity, 
	- Rapid Prototyping (Programming Time)
	- Robustness and Stability of the software
	- Wider Collection of features and Functionality
	- Security
	- User Friendliness
	- Scalability => related to performance
	""")
end

# ╔═╡ dc8d89be-4d72-11eb-13e8-718f21bc1362
md"""
**Why Study Analysis of Algorithms and Performance though its in bottom of the above list ?**
- Performance related to User Friendliness (too long lag makes it less user friendly), also related to Security
- Performance draws the line between feasible and not feasible. (If its not fast enough or uses too much memory it is not useable) => bring you to cutting edge of entrepreneurship
- Algorithms give language to talk about program behaviour and Quantify the resource measure of the algorithm
- Efficiency is a concern for large scale problems (scalability): Solving Large Problems with Large Inputs
- Cases where the solution might not be really clear on how to do (or even to state clearly) such as Ml, CV, NLP, Playing Games

Examples
- Shortage Path between two points given map of all highways
- Best Assignment of Resources to People or Jobs to machines, Scheduling
- Measuring Similarity of two Documents
- Human Genome
- Social Network in Facebook
"""

# ╔═╡ f3972612-4d73-11eb-3d7a-ff39ee463047
md"""
#### Two functions might produce the same output but have different efficiency?
"""

# ╔═╡ e8a90d58-4d73-11eb-3d34-b93907fef7bc
begin
	function f1(n)
	    for i in 1:2
	        n += 100 
		end
	    return n
	end
	
	function f2(n)
	    for i in 1:100
	        n += 2
		end
	    return n
	end
	
	f1(10),f2(10)
end

# ╔═╡ 9a9926ca-4d73-11eb-35fb-8529f7e050d4
md"""
## How should we measure the running time of the algorithms?

Experimental Approach
1. Write a program that implements the program
2. Run the program with the datasets of varying size and composition
3. Measure system time to get an accurate measure of the actual running time.

we can use `@time` macro to measure runtime.

System time might not be accurate enough. 
- There are multiple process running in the background which leads to random noise in runtime measurements => Take Measurement Multiple Times.
- Compilation time and Runtime might need to be separated.

Popular tool for Julia [BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl) creates a `@benchmarkable` object and uses `tune!` to figure out the params (such as number of samples to evaluate) and even set params by oneself before executing the benchmark trials and collecting samples. One can also run GC before starting a benchmark with `gctrial=true` and before taking samples with `gcsample=true`. Also set time to run with `seconds=300` to prolong the  benchmark time.
"""

# ╔═╡ 9a1431b8-4d73-11eb-3381-8bb9213a52cd
b = @benchmark sum(sin.(cos.(rand(100_000))))

# ╔═╡ 99e369c0-4d73-11eb-1d56-53a3da9bedda
begin
	using Plots
	histogram(b.times)
end

# ╔═╡ f201e03c-4d73-11eb-26d4-3150337daec6
md"""
#### Limitations of experimental study
- need to implement the algorithm before we can test the running time.
- we can only perform experiment on a limited set of inputs, this may not be indicative of running time on different set of data
- for comparison of two algorithms, the same hardware and software environment as well as operating environment needs to be maintained.

Benchmarking on different systems will result in different speeds need a more generalized method to analyze and communicate the performance of the algorithm.
- use high-level description of algorithm (pseudocodes) instead of testing implemented program
- take into account all possible inputs
- evaluate efficiency independent of hardware and software environment as well as tiny implementation details.

"""

# ╔═╡ c32d52c6-4d7a-11eb-3a20-019cdb3c889b
md"""
Pseudocode Convention for low-level Primitive operations.
- Data assignment: use = for assignment
- Arthimetic and logical operations: == for equality, (=,-,*,/) use standard mathematical symbols
- Programming Constructs
    - Conditionals: if ... then ... [else if ... ] [else ...]
    - Loops
        - While ... do ...
        - repeat ... until ...
        - for ... do ...
    - array indexing: A[i], A[i,j]
    - Methods
        - Declaration: **Algorithm** methodname(arg1, arg2)
        - calls: methodname(args)
        - returns: return value

Julia Code is very similar to Pseudocode
"""

# ╔═╡ eb203a78-4d7a-11eb-2e5a-13c68c97a58c
md"""
## Asymptotic Analysis: How does runtime scales with input size ?
Ignore Machine dependent constants, look at the growth of the running $T(n)$ as $n -> \infty$ rather than actually running time.

Three Types of Analysis
- Worst-case (usually): $T(n)$ = max time on any input of size n
- Average-case (sometimes): $T(n)$ = expected time over all inputs of size n. (Expectation needs assumption of statistical distribution of time)
- Best-case (Not useful: eg sorting a sorted array)


"""

# ╔═╡ a3d6e466-4d80-11eb-1d4e-933988883a5b
md"""
## Notations
Bounded From Above

> Big-O : $f(n) = O(g(n)) \text{ or } f \preceq g, \quad \exists N,c \ : \ \forall n \geq N, f(n) \leq c \cdot g(n)$ 
- eg: $3n^2+5n+2 \leq 3n^2+5n^2+2n^2$ both are $O(n^2)$ as they have the same growth rate. Smaller items are general omited
- eg: $O(\log(n))$ is same for $\log_2(n)$, $\log_{10}(n)$, $\log_x(n)$  base doesn't matter as they only differ by a constant multiple
- since $n^a \prec n^b \quad \forall 0 <a<b : n=O(n^2),\  \sqrt(n) = O(n)$ O(n^2) grows faster
- also $n^a \prec b^n \quad \forall a> 0 b>0 : n^5=O((\sqrt2)^n),\  n^{100} = O(1.1^n)$
- also $(\log n)^a \prec n^b \quad \forall (a,b>0): (\log n)^3 = O(\sqrt(n)), n \log n = O(n^2)$

"""

# ╔═╡ f273f432-4d8d-11eb-0d4b-e330161da74b
md"""

log $(@bind plotlog html"<input type=checkbox >") 
sqrt $(@bind plotsqrt html"<input type=checkbox >") 
n $(@bind plotn html"<input type=checkbox >")
n logn $(@bind plotnlogn html"<input type=checkbox >")
n² $(@bind plotnsq html"<input type=checkbox >")
2ⁿ $(@bind plot2n html"<input type=checkbox >")

`plotrange = ` $(@bind plotrange html"<input type=range min=2 max=50 step=1 value=10>")
"""

# ╔═╡ 1a95c1d8-4d7b-11eb-2c23-abfd4e673b3c
begin
	#using LaTeXStrings
	plot([n->log(n), n->sqrt(n),n->n, n->n*log(n),n->n^2,n->2^n], 1:0.1:plotrange,label=(["log(n)" "sqrt(n)" "n" "n*log(n)" "n^2" "2^n"]))
end

# ╔═╡ 82abcbc4-4d84-11eb-05e7-b7fdd509052b
md"""
$$\log{n} \prec \sqrt{n} \prec n \prec n \log{n} \prec n^2 \prec 2^n$$
"""

# ╔═╡ 399e9e2a-4d8e-11eb-315a-319497f05e8b
md"""
For function f,g : $\mathbb N \rightarrow \mathbb R^+$ we say that
- Big-Ω: $f(n) = \Omega(g(n)) \text{ or } f \succeq g \text{ if for some }c, f(n) \geq c \cdot g(n)$ f grows slower than g 
- Big-Θ:$f(n) = \Theta(g(n)) \text{ or } f \asymp g \text{ if }, f = O(g) \text{ and } f= \Omega(g)$ f grows at the same rate as g 
- little-o : $ f(n) = o(g(n)) \text{ or } f \prec g \text{ if } f(n)/g(n) \rightarrow 0 \text{ as } n \rightarrow \infty $ f grows slower than g 
"""

# ╔═╡ 0522e1fe-4d90-11eb-32fe-dd3a37e7d498
md"""
Big-O looks only asymptotic detail (useful for very large data) and loses important information about constant multiples. But change by a factor of 100 or 2 is still a big deal. Once we have a good asymptotic run time we can then look into other details such as benchmarking, interaction with memory hierarchy,...
"""

# ╔═╡ 256fd75e-4d73-11eb-0ba3-cd5276a8640c
md"""
## References
- [MIT 6.006 Introduction to Algorithms](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/)
- [MIT 6.046 Design and Analysis of Algorithms](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-046j-design-and-analysis-of-algorithms-spring-2015/)
- [UCSandiegoX DSA](https://www.edx.org/micromasters/ucsandiegox-algorithms-and-data-structures)
- [GTX DSA](https://www.edx.org/professional-certificate/gtx-data-structures-and-algorithms)
- [Algorithms](https://en.wikipedia.org/wiki/Algorithm)

"""

# ╔═╡ Cell order:
# ╟─bdb2792e-4d71-11eb-1c5b-03e16bad7067
# ╟─0a158d10-4d72-11eb-3bf5-0ff33f2b9b9d
# ╟─dc8d89be-4d72-11eb-13e8-718f21bc1362
# ╟─f3972612-4d73-11eb-3d7a-ff39ee463047
# ╠═e8a90d58-4d73-11eb-3d34-b93907fef7bc
# ╟─9a9926ca-4d73-11eb-35fb-8529f7e050d4
# ╠═2940cb92-4d76-11eb-3628-493a998f3033
# ╠═9a1431b8-4d73-11eb-3381-8bb9213a52cd
# ╠═99e369c0-4d73-11eb-1d56-53a3da9bedda
# ╟─f201e03c-4d73-11eb-26d4-3150337daec6
# ╟─c32d52c6-4d7a-11eb-3a20-019cdb3c889b
# ╟─eb203a78-4d7a-11eb-2e5a-13c68c97a58c
# ╠═a3d6e466-4d80-11eb-1d4e-933988883a5b
# ╟─f273f432-4d8d-11eb-0d4b-e330161da74b
# ╟─1a95c1d8-4d7b-11eb-2c23-abfd4e673b3c
# ╟─82abcbc4-4d84-11eb-05e7-b7fdd509052b
# ╠═399e9e2a-4d8e-11eb-315a-319497f05e8b
# ╟─0522e1fe-4d90-11eb-32fe-dd3a37e7d498
# ╟─256fd75e-4d73-11eb-0ba3-cd5276a8640c
