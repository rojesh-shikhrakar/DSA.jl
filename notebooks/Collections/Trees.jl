### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 21c50854-502a-11eb-3de4-7955c27ab0de
using LightGraphs, GraphPlot

# ╔═╡ df733764-5029-11eb-0068-7f149693d12c
md"""
# Trees

An extention of Linked list, such that a node(parent) can have multiple sub-nodes(children). A child node can have only one parent node. Start from a root node (Level 1) it branches out to multiple nodes (Level 2 and further to 3,4,...) and end on leafs (without any children). Height of node is the number of edges between itself and the root. Depth is inverse of height.

A tree must be completely conneced (there's always a path (group of edges) from root to the node) and there is no cycle.

Operations:
- Tree Traversal isn't as clear as in linked list
    - Depth-first Search (DFS): Move through one entire path to a leaf before moving to another path. If children are unexplored explore them first.
        - Pre-order Traversal: Check off the node as soon as you see it before checking its children. Check the left-most nodes by convention.
        - In-order Traversal: Check off the node when we see its left child and come back to it.
        - Post-order Traversal: Check off the node only after checking all its children (starting from the right or left, generally left by convention)
    - Breadth-first Search (BFS) or Level order: Priority visit all children on the same level before moving to child nodes (By Convention move from Left to right).
    
![Tree Traversal](https://algorithms.tutorialhorizon.com/files/2015/11/Tree-Traversals.png)

"""

# ╔═╡ 292cacf0-502a-11eb-03fd-735f45f94dc4
md"""
## Binary Trees

Nodes can have at most two children (0,1 or 2 children).

Since there is no order here we need to go through each node to search an element. Search is O(n)

Operation
- Deletion of a middle node is bit complicated it is also O(n)
- Insertion at a node need to travel down the path to find an empty spot
"""

# ╔═╡ 323e33d6-502a-11eb-304c-994320ec1518


# ╔═╡ Cell order:
# ╠═df733764-5029-11eb-0068-7f149693d12c
# ╠═21c50854-502a-11eb-3de4-7955c27ab0de
# ╠═292cacf0-502a-11eb-03fd-735f45f94dc4
# ╠═323e33d6-502a-11eb-304c-994320ec1518
