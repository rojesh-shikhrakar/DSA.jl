### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 4aebe8f8-502d-11eb-1925-694f35421317
md"""
# Recursion

Recursive function calls itself with a smaller instance of the same problem and ends with a base case. Three required ingredients:
1. Calls itself
2. with a smaller input parameter
3. end with a base case


Be careful with Infinite Recursion, which can occur when
- parameter don't decrease/increase towards the base case criteria
- base case cannot be reached


"""

# ╔═╡ 8c30ca4a-502d-11eb-2c0b-398047ab685f
function addrecursive(x)
	x >= 1 && error("x < 1")  # Defense against infinite recursion 
    if x == 1  # if x is less than 1 this becomes an infinite recursion
        return 1
    else 
        return x + addrecursive(x - 1)
    end
end

# ╔═╡ 0d1581d2-502e-11eb-2b2b-e3cc836fc2b0
# The Call Stack of Recursion

# ╔═╡ 130ca5e8-502e-11eb-3f82-5ff3930f7421
# Recurrence Relations


# ╔═╡ 1b0fe3ae-502e-11eb-2d34-c5a885ec3791
md"""
Applications
- Factorial
- Reverse a string
- Palindrome Checking
- List permutation
- String Permutations
- keypad Combinations
- deep reverse ?
- Tower of Hanoi
- Staircase ?



"""

# ╔═╡ Cell order:
# ╟─4aebe8f8-502d-11eb-1925-694f35421317
# ╠═8c30ca4a-502d-11eb-2c0b-398047ab685f
# ╠═0d1581d2-502e-11eb-2b2b-e3cc836fc2b0
# ╠═130ca5e8-502e-11eb-3f82-5ff3930f7421
# ╠═1b0fe3ae-502e-11eb-2d34-c5a885ec3791
