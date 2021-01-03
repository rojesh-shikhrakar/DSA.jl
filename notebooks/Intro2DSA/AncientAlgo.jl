### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 938f32d0-4dc2-11eb-29e1-19b4e28bf3c8
using BenchmarkTools, Random, DataFrames, Plots

# ╔═╡ 12341f32-4dbf-11eb-1753-6fac96fd666a
md"""
# Ancient Algorithms

The concept of algorithm has existed since ancient ages. Babylonian (c. 2500 BC) and Egyptian (c. 1550 BC) used arithmetic algorithms for example division. Greek mathematicians used the sieve of Eratosthenes for finding prime numbers, and the Euclidean algorithm for finding the greatest common divisor of two numbers.


The word algorithm itself was derived from the name of the 9th-century Persian mathematician Muḥammad ibn Mūsā al-Khwārizmī (c. 780–850) , whose name (Khwarazm) was Latinized as Algoritmi.
"""

# ╔═╡ 10ef1d92-4dc0-11eb-3524-bd5cb089a31b
md"""
## The Peasant Multiplication

Origin: Russian and Egyptian

Idea: To multiply two positive integers a and b, 
- we can instead compute (a/2)*(2b) if a is even and 
- ((a − 1)/2) * (2b) + b if a is odd.

**Algorithm Analysis:**
- a is reduced by at least a factor of 2, at the cost of one halving, one doubling, and possibly one addition.
- If we assume that halving, doubling, and addition are all constant-time operations, then the total computational complexity of the algorithm is proportional to the number of binary digits of a.
- Converges to correct answer
"""

# ╔═╡ 09744cea-4dc0-11eb-11b0-c7c6b42683bc
html"""
<iframe width="560" height="315" src="https://www.youtube.com/embed/HJ_PP5rqLg0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
"""

# ╔═╡ aae2f0aa-4dbf-11eb-3f50-39e262cc1845
function peasantprod(a::T, b::T) where T <: Integer
    c = zero(T)
    while a > one(T)
        if isodd(a)
            c = c + b
        end
        a = a >> 1 # divide a by 2
        b = b << 1 # multiply b by 2
    end
    return c + b
end

# ╔═╡ 81d2d826-4dc0-11eb-2efb-9f5ef5161edd
peasantprod(10, 33)

# ╔═╡ 87f00406-4dc0-11eb-29b9-6b5c19d03b53
md"""
## Babylonian Method for finding square root

Still used by many calculators.

Idea:

$$x \cdot \frac{a}{x} = a = \sqrt{a} \sqrt{a}$$

- If $x < \sqrt{a}$, then $\frac{a}{x} > \sqrt{a}$
- If $x > \sqrt{a}$, then $\frac{a}{x} < \sqrt{a}$

Take averge of the two

$X_{n+1} = \frac{X_n + \frac{a}{X_n}}{2} = \frac{X_n^2 + a}{2 X_n}$


"""

# ╔═╡ a78d5570-4dc0-11eb-37a8-adc45a4964ee
function babylonian(a::T, tol::T) where T <: Real
    x = one(T)  # start x at 1
    while abs(x^2 - a) > tol  # convergence test
        x = (x + c / x) / 2
    end
    return x
end

# ╔═╡ c0c78d52-4dc1-11eb-325d-81452aa6d218


# ╔═╡ 0dd9ea7c-4dc2-11eb-1b99-f7b120c21a70
md"""
## [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) for finding primes

Iteratively mark of all composites of the identified prime.

![Sieve of Eratosthenes](https://upload.wikimedia.org/wikipedia/commons/b/b9/Sieve_of_Eratosthenes_animation.gif)

"""

# ╔═╡ 371f8004-4dc2-11eb-340e-c367fc0d718d
begin
	function es(n::Int)
	    isprime = trues(n)  # n-element vector of true-s
	    isprime[1] = false  # 1 is not a prime
	    for i in 2:isqrt(n)  # loop integers less or equal than sqrt(n)
	        if isprime[i]  # conditional evaluation
	            for j in i^2:i:n  # sequence with step i
	                isprime[j] = false 
	                end
	            end
	        end
	    return filter(x -> isprime[x], 1:n)# filter using an anonymous function
	    end
	
	println(es(100))# print all primes less or equal than 100
	@time length(es(10^6))# check function execution time and memory usage
end

# ╔═╡ 5a9e6414-4dc2-11eb-2ed3-8f6abe2b7847
md"""
## Greatest Common Divisor (GCD)

For integers a and b (likely to be very large positive integers), GCD(a,b) is the largest integer d that divides both a and b. GCD is very important in number theory such as factorization, prime numbers and hence cryptography.
"""

# ╔═╡ 61a2ce56-4dc2-11eb-3b58-df1a7f2bf4d6
begin
	"""GCD using the definition of GCD"""
	function GCDnaive(a,b)
	    largest = 0
	    for d in 1:min(a,b)   # runtime ~min(a,b)
	        if a%d==0 && b%d==0
	            largest = d
	        end
	    end
	    return largest
	end
	
	@assert GCDnaive(8,12)==4
	@benchmark GCDnaive(3918848,1653264)
end

# ╔═╡ c3fdeae2-4dc2-11eb-0d57-598c117205c7
md"""
### Euclidean GCD

**Lemma:**
> Let $a'$ be the remainder when a is divided by b, then $$gcd(a,b) = gcd(a',b)= gcd(b,a')$$

**Proof**
- when a is divided by b, $a = b*q + a'$
- now d divides a and b if and only if it divides $a'$ and $b$

Each step reduces the size of the numbers by about a factor of 2. Takes about log(ab) steps
"""

# ╔═╡ e0401ae0-4dc2-11eb-2ba6-9d18e1915fa1
begin
	function GCDEuclid(a,b)
	    if b == 0 
	        return a
	    else
	        return GCDEuclid(b,a%b)
	    end
	end
	
	# onliner
	GCD(a,b) = b==0 ? a : GCD(b , a%b)
	
	@benchmark GCDEuclid(3918848,1653264)
end

# ╔═╡ f40e1e6e-4dc2-11eb-2c04-d7020e727f7f
md"""
## Fibonacci Numbers

Developed by to study Rabbit Population after multiple genertions

$$F_n = \begin{cases} 0, \qquad n=0, \\ 1, \qquad n=1, \\ F_{n+1} + F_{n+2}, \quad n>1 \end{cases}$$

This has a rapid growth. $F_n \geq 2^{n/2} \text{ for } n \geq 6$

"""

# ╔═╡ 02317fca-4dc3-11eb-34c4-a5e009b09775
begin
	"""Fibbonaci Implementation directly from definition"""
	function fibbo_naive(n::Integer)
	    n >= 0 || throw(DomainError(n, "Domain: n ≥ 0"))
	    if n <= 1
	        return n
	    else
	        return fibbo_naive(n-1) + fibbo_naive(n-2)
	    end
	    
	end
	
	# Do not try huge numbers here
	@assert fibbo_naive(1) == 1
	@assert fibbo_naive(7) == 13	
end

# ╔═╡ 1b865a74-4dc3-11eb-25ac-d56e25e7b4b6
md"""
If T(n) is the Lines of Code executed by the function on input n. If you step through the debugger you can calculate the number of lines  for the implementation.

$$T(n) = \begin{cases} 2, \qquad n \leq 1, \\ F_{n+1} + F_{n+2} + 3, \quad n >1 \end{cases}$$
$$\therefore T(n) \geq F_n$$

$T(100) \approx 1.77 * 10^{21} \approx 56000$ years at 1GHz

Why is this so slow?
![Fibbonacci call stack](https://idawud.tech/assets/img/support/fibonacci_1.png)
For evaluating any number same number has to be evaluated multiple times eg f(3), f(2) has been repeatedly evaluated so many times, this increases exponentially when n is very large.

When we calculate manually we don't redo such calculation but rather use only the last two numbers.
"""

# ╔═╡ 0eea1918-4dc3-11eb-1484-b7f0db8d3a9a
begin
	function fibbo_efficient(n::Integer)
	    n >= 0 || throw(DomainError(n, "Domain: n ≥ 0"))
	    n <= 1 && return n
	    
	    Fn = zeros(Integer, n + 1)
	    Fn[1:2] = [0, 1]  # you can only store two numbers
	    
	    for i = 3:n+1 
	        Fn[i] = Fn[i-1] + Fn[i-2]
	    end
	    
	    return Fn[end]
	end
	
	@assert fibbo_efficient(7) == 13
	
	@benchmark fibbo_efficient(50)
end

# ╔═╡ b98372a2-4dc3-11eb-2956-69554b9ff7b8
md"""
$$T(n) = \begin{cases} 2, \qquad n \leq 1, \\ 2n + 3, \quad n >1 \end{cases}$$

$T(100) \approx 202$ Incredibly fast compared to above
"""

# ╔═╡ Cell order:
# ╟─12341f32-4dbf-11eb-1753-6fac96fd666a
# ╠═938f32d0-4dc2-11eb-29e1-19b4e28bf3c8
# ╟─10ef1d92-4dc0-11eb-3524-bd5cb089a31b
# ╟─09744cea-4dc0-11eb-11b0-c7c6b42683bc
# ╠═aae2f0aa-4dbf-11eb-3f50-39e262cc1845
# ╠═81d2d826-4dc0-11eb-2efb-9f5ef5161edd
# ╟─87f00406-4dc0-11eb-29b9-6b5c19d03b53
# ╠═a78d5570-4dc0-11eb-37a8-adc45a4964ee
# ╠═c0c78d52-4dc1-11eb-325d-81452aa6d218
# ╠═0dd9ea7c-4dc2-11eb-1b99-f7b120c21a70
# ╠═371f8004-4dc2-11eb-340e-c367fc0d718d
# ╟─5a9e6414-4dc2-11eb-2ed3-8f6abe2b7847
# ╠═61a2ce56-4dc2-11eb-3b58-df1a7f2bf4d6
# ╟─c3fdeae2-4dc2-11eb-0d57-598c117205c7
# ╠═e0401ae0-4dc2-11eb-2ba6-9d18e1915fa1
# ╟─f40e1e6e-4dc2-11eb-2c04-d7020e727f7f
# ╠═02317fca-4dc3-11eb-34c4-a5e009b09775
# ╟─1b865a74-4dc3-11eb-25ac-d56e25e7b4b6
# ╠═0eea1918-4dc3-11eb-1484-b7f0db8d3a9a
# ╟─b98372a2-4dc3-11eb-2956-69554b9ff7b8
