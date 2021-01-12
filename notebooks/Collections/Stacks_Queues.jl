### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 659840fe-502b-11eb-1c22-b971c3425be2
md"""
# Stacks & Queues
"""

# ╔═╡ 06ac35da-502b-11eb-01c1-1974550a834f
md"""
## Stacks

Implemented with:
- An Array where the last element is top of the Stack following LIFO (Last In First Out). 
- A singly linked list can also be used to create a stack as we'll only have to track the front of the list, and keep adding element on top of it.

Operations:
- Push on top of the stack
- Pop from the top of the stack

"""

# ╔═╡ 18dd6bc2-502b-11eb-38e5-e900758f4b61
# Eg: Balanced Paranthesis


# ╔═╡ 7607b956-502b-11eb-01d4-ff83de1d9425
# Eg: Reverse Polish Notation

# ╔═╡ 7f79655c-502b-11eb-31f0-0588189afd4b
# Reversing a Stack

# ╔═╡ 872861fe-502b-11eb-3560-8f03be0bd627
# Minimum Bracket Reversals

# ╔═╡ 8d21363a-502b-11eb-1ee2-01b8cd790c77
md"""
## Queue

Has both Head and Tail

Implementation with
- Linked List : save references for both head and tail
- Array:
- Using a Stack:

Operations:
- Peek the head: no removal
- Dequeue from the head: get the element and remove the element
- Enqueue to the tail : add to element to the tail of the queue

"""

# ╔═╡ f41e2c08-502b-11eb-059e-57e5a1649134


# ╔═╡ f6019938-502b-11eb-267d-0b8e833e7bc5
# Reversing a Queue

# ╔═╡ c87d9b24-502b-11eb-08bb-63a08de5950d
md"""
### Deques: Double Ended Queues

Double Ended queue that goes both ways, i.e. enque or deque from both ends.

Like a Generalized version of both stack and queue and can be treated as stack or queue.

"""

# ╔═╡ f3086ec8-502b-11eb-3041-fde296acea0f


# ╔═╡ ca1eb40e-502b-11eb-0d3c-81d1bf5ee4b7
md"""
### Priority Queue

Elements are enqueued with a priority and are dequeued with the highest priority first
"""

# ╔═╡ f2624340-502b-11eb-3b70-ad34edaf5a99


# ╔═╡ Cell order:
# ╟─659840fe-502b-11eb-1c22-b971c3425be2
# ╟─06ac35da-502b-11eb-01c1-1974550a834f
# ╠═18dd6bc2-502b-11eb-38e5-e900758f4b61
# ╠═7607b956-502b-11eb-01d4-ff83de1d9425
# ╠═7f79655c-502b-11eb-31f0-0588189afd4b
# ╠═872861fe-502b-11eb-3560-8f03be0bd627
# ╠═8d21363a-502b-11eb-1ee2-01b8cd790c77
# ╠═f41e2c08-502b-11eb-059e-57e5a1649134
# ╠═f6019938-502b-11eb-267d-0b8e833e7bc5
# ╠═c87d9b24-502b-11eb-08bb-63a08de5950d
# ╠═f3086ec8-502b-11eb-3041-fde296acea0f
# ╠═ca1eb40e-502b-11eb-0d3c-81d1bf5ee4b7
# ╠═f2624340-502b-11eb-3b70-ad34edaf5a99
