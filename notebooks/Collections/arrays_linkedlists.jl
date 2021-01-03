### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ ff2837d2-4dd4-11eb-2442-db690b83f6ee
using DataStructures

# ╔═╡ cb44de38-4dc9-11eb-0027-eb8cdb77d454
md"""
# Collections

Data structures are containers that organize and group data together in different ways. Collection is a very general structure that store item that doesn't have any order.

- List is an order collection without a fixed length
- Set is an unorder collection with only unique elements

#### Two Relevant Models of Computation

A computational model describes how units of computations, memories, and communications are organized. This help to determine what operations an algorithm is allowed and hence measure the computational complexity (time and space) of the algorithm.
 
1. [Random Access Machine (RAM)](https://en.wikipedia.org/wiki/Random-access_machine)
RAM is an abstract machine modelled by a big array (in register) with $\Theta(1)$ time to load word from register from one to another, perform operation(+,−,∗,/,&,|,ˆ). Python list is modelled after RAM


2. [Pointer Machine](https://en.wikipedia.org/wiki/Pointer_machine)
dynamically allocated objects(namedtuple) with O(1) fields (contain word or pointer). Objects with O(1) attributes modelled after Pointer Machine (a.next)
"""

# ╔═╡ 6b81197a-4dca-11eb-1fca-93d5b121174c
md"""
## Array modelled after RAM

An array is a list with indexing. Depending on programming language array might have different properties such as having fixed length, containing only same type of element. But common to all array has locations each element allowing direct access to each element through index (location). They are stored in memory in one _contiguous block_ modelled after RAM.

- Indexable O(1) i.e constant time access: `getindex(l, idx)` and `setindex!(l, data, idx)`
- Insertion of element
  - Insertion at the end is easier, might run into problems when array has a set size
  - Insertion in the beginning and middle is difficult as we need to move everything behind the insertion position a step back. O(n) operation
- Deletion
  - Deletion at any point needs to move everything behind the insertion point a step ahead.


"""

# ╔═╡ b50142de-4dd4-11eb-3a00-a541ecda8cc0
fruitslist = ["🍎","🍌","🍍","🍐", "🍑","🍓"]

# ╔═╡ e889cb4e-4dd4-11eb-2584-05626659c3b3
# pop, append

# ╔═╡ f1164634-4dd4-11eb-0d20-773a92d68ead
md"""
## Linked List modelled after Pointer Machine

Adding and removing element from an array is slightly complicated, need to shift the remaining whole array. 

Linked list (A list of sequentially linked nodes) allows efficient insertion of nodes to the front of the list

While Array stores a value and has an index. Linked list stores a value and a pointer to the next element. This can allow linked list to be stored in non-contiguous memory. This also makes it efficient to add and remove element.

![LinkedList](https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Singly-linked-list.svg/408px-Singly-linked-list.svg.png)

Insertion takes O(1) time.
"""

# ╔═╡ 082bca6a-4dd5-11eb-2a6c-1b272a805e00
begin
	# imutable list
	
	l1 = nil()  # create a empty linked list
	l1 = cons(1, l1)
	l1 = cons(2, l1)
	l1 = cons(4, l1)
	l1 = cons(3, l1)
	l1 = cons(6, l1)
	l2 = map((x) -> x*2, l1)
end

# ╔═╡ 24f49228-4de0-11eb-207e-3982680d86c8
md"""
### Pascals Triangle

Triangular array of binomial coefficients where its nth row and kth column can be constructed from previous row as follows:

$ \binom{n}{k}  = \binom{n-1}{k-1} + \binom{n-1}{k} $

![Pascal's Triangle](https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif)
"""

# ╔═╡ ebf4807a-4dda-11eb-2531-add87fbfb72a
function Pascaltriangle(n::Int)
	l = nil(Array{Int});  n == 0 && return l
	l = cons([1], l); n==1 && return l
	l = cons([1,1],l);
	for i = 3:n
		lnew = ones(length(first(l))+1)
		for j =2:i-1
			lnew[j] = first(l)[j-1] + first(l)[j] 
		end
		l= cons(lnew, l)
	end
	return l
end

# ╔═╡ 628f92c8-4ddc-11eb-19be-4bcde1b5d680
Pascaltriangle(8)

# ╔═╡ 1380e2ee-4dd5-11eb-1c65-776ea288e5a2
md"""
### Doubly Linked List

Allows traversing in both direction.
![Doubly Linked List](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Doubly-linked-list.svg/610px-Doubly-linked-list.svg.png)

The `MutableLinkedList` type implements a doubly linked list with mutable nodes.

- Indexable O(n): 
  - `getindex(l, idx[or range])` or `l[idx]`
  - `setindex!(l,data,idx)` or `l[idx]=data` is defined.
- Insertion: 
  - in the begining O(1) : `pushfirst!(l, data)`
  - in the end O(1) : `push!(l, data) ` or `append!(l, elts...) ` or `append!(l1,l2)` 
  - in the middle O(n):
- Removal: 
  - from the begining O(1) : `popfirst!(l)`
  - from the end O(1) : `pop!(l) ` 
  - from the middle O(n): `delete!(l,idx[or range])`
"""

# ╔═╡ 31faaa82-4dd5-11eb-31f8-e149054b2990
begin
	l = MutableLinkedList{Int64}(collect(1:100)...)    # initialize
	
	first(l), last(l)
end

# ╔═╡ 4b74d0f0-4dd5-11eb-239e-1d3e2b4f769e
md"""
#### Reversing a linked list

"""

# ╔═╡ 577fb59c-4dd8-11eb-1800-237d644677ae
reverse(l)

# ╔═╡ 52c3b400-4dd5-11eb-0519-03a4b8f97579
md"""
#### Flatten a nested linked list
"""

# ╔═╡ 5a791804-4dd5-11eb-3f7a-013eddac9a12


# ╔═╡ 5ed65876-4dd5-11eb-389f-458a3913abe2
md"""
### Circular Linked List

Last node of the list rather than having a null reference points back first node of the list.

![Circular Linked List](https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Circularly-linked-list.svg/350px-Circularly-linked-list.svg.png)
"""

# ╔═╡ d45c7102-4de2-11eb-2d7e-9d4e5843c16f
md"""
### Multiply linked list

As extention of Doubly Linked List, where each node contains two or more link fields that allows to connect the same set of data records in different order.

"""

# ╔═╡ Cell order:
# ╟─cb44de38-4dc9-11eb-0027-eb8cdb77d454
# ╟─6b81197a-4dca-11eb-1fca-93d5b121174c
# ╠═b50142de-4dd4-11eb-3a00-a541ecda8cc0
# ╠═e889cb4e-4dd4-11eb-2584-05626659c3b3
# ╟─f1164634-4dd4-11eb-0d20-773a92d68ead
# ╠═ff2837d2-4dd4-11eb-2442-db690b83f6ee
# ╠═082bca6a-4dd5-11eb-2a6c-1b272a805e00
# ╟─24f49228-4de0-11eb-207e-3982680d86c8
# ╠═ebf4807a-4dda-11eb-2531-add87fbfb72a
# ╠═628f92c8-4ddc-11eb-19be-4bcde1b5d680
# ╟─1380e2ee-4dd5-11eb-1c65-776ea288e5a2
# ╠═31faaa82-4dd5-11eb-31f8-e149054b2990
# ╟─4b74d0f0-4dd5-11eb-239e-1d3e2b4f769e
# ╠═577fb59c-4dd8-11eb-1800-237d644677ae
# ╠═52c3b400-4dd5-11eb-0519-03a4b8f97579
# ╠═5a791804-4dd5-11eb-3f7a-013eddac9a12
# ╟─5ed65876-4dd5-11eb-389f-458a3913abe2
# ╟─d45c7102-4de2-11eb-2d7e-9d4e5843c16f
