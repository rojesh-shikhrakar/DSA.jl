### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ c2efdfae-502c-11eb-24f3-ef331e609508
md"""
# Set

Set is a collection without an order and doesn't allow repeatition of an element. And similar to Mathematical set we can perform set operations on these data structures
"""

# ╔═╡ 08c92a08-502d-11eb-056b-794d9230ea3f
begin
	A = Set([1,2,3])
	B = Set([2,3,4])
	A ∪ B
end

# ╔═╡ 1b8e7af8-502d-11eb-269c-d1f3e80a2b0e


# ╔═╡ d61a4b96-502c-11eb-0265-ef3964d04fd1
md"""
# Map (Dictionaries)

Associative Data Structure that associates a Key with a Value. Keys in a map is a set, i.e each key exist only once.

"""

# ╔═╡ 27bdcffc-502d-11eb-25ba-fbc0720d76fb
dict1 = ["a" => 1, "b"=>2, "c"=>3]



# ╔═╡ dc9ec154-502c-11eb-30ac-61ee85f7dc15
md"""
# Hashing allows O(1) lookups

- In arrays, list we need to look through every element hence in lookups are in linear time.
- In stacks and queues, we can lookup the start or end almost immediately
- priority queues allows to access priority element fast but linear time for other elements


Hash functions coverts a value to a hash value that is used as index in an array. How ?
- One easiest approach is to divide the last few digits by certain number and use remainder as index to store the elements in as an array. And access elements by indexing in constant time.
- 

Collision (same hash value for multiple item) can occur. There are two main ways to handle collision
1. Change hash function completely, or change the number for division to get enough slots for all values
    - using bigger number need a larger space to maintain a constant time lookup. Changing numbers requires moving data to a new arrays
2. Change the structure of arrays to buckets: rather than store one value in the slot store collection of values in the buckets
    - need to iterate through a list or link list. on average has a constant time look up but in worst case it can become linear time O(n).
    - Can use second hash function inside the bucket to further split the data
    

"""

# ╔═╡ e0e1b918-502c-11eb-1506-819b3261e35e
md"""
# Hash Maps

using Keys to create Hash values.

Strings can be converted using ASCII values for first few laters as hash values.

"""

# ╔═╡ e69324b6-502c-11eb-0307-13492268de72


# ╔═╡ Cell order:
# ╠═c2efdfae-502c-11eb-24f3-ef331e609508
# ╠═08c92a08-502d-11eb-056b-794d9230ea3f
# ╠═1b8e7af8-502d-11eb-269c-d1f3e80a2b0e
# ╠═d61a4b96-502c-11eb-0265-ef3964d04fd1
# ╠═27bdcffc-502d-11eb-25ba-fbc0720d76fb
# ╠═dc9ec154-502c-11eb-30ac-61ee85f7dc15
# ╠═e0e1b918-502c-11eb-1506-819b3261e35e
# ╠═e69324b6-502c-11eb-0307-13492268de72
