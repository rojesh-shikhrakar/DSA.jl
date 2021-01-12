### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 569d9456-502c-11eb-0c7c-f58cd18dfe88
using LightGraphs, Distributions, GraphPlot

# ╔═╡ 2a4592b2-502c-11eb-03a0-757db81b78ab
md"""
# Graph: Data Structure with Relations

A Graph is a pair $G = (V,E)$, where V is a set of vertices (a finite set, numbers) and E is edge set that defines which vertices are connected. 

$ E \subseteq {N\choose k} $

Both Nodes and Edges can store information. Edges can even have direction (Directed Graphs) **from** one node **to** another node. Graphs can even have cycles where there is a path from one node to itself. Cyclic Graphs can lead to infinite loops. Tree is a specific type of acyclic graph. Directed Acyclic Graph (DAG) is a very popular type of graph.

**Common Properties of Graphs**
- Connectivity: A connected graph does not have any disconnected vertices. Connectivity is the measure of the minimum number of elements that needs to be removed for the graph to become disconected. 

"""

# ╔═╡ 5b8f7484-5031-11eb-21eb-4b0253f2d6dc
md"""
## Representations of Graphs
"""

# ╔═╡ c1f15916-5031-11eb-2476-051e956b35fa
# Creating vertices and edge objects and defining their connections


# ╔═╡ c540dd8a-5031-11eb-02b0-bdb19c98ffc1
# Array: Edge List that shows the connection between different vertices

# ╔═╡ 7e20525a-5031-11eb-18ca-49a54f458d7b
# Adjacency List: where the index represent a vertex and the list stored in that index consist of vertices that are adjacent to the vertex

adj = [[2],[1,3],[2,4],[3]]

# ╔═╡ ebda4bd2-502e-11eb-153c-dfc4a041926c
# Adjacency Matrix : Matrix representation of Adjacency list,

adjmat = [0 1 0 0
		  1 0 1 0
		  0 1 0 1
		  0 0 1 0]

# diagonal is zero, also symmetric along the diagonal

# ╔═╡ deb4fbd2-502e-11eb-097b-5b2cc713ffb3
md"""
## Graph Traversals: BFS & DFS


"""

# ╔═╡ 6aec3140-502c-11eb-0896-1f5543983ffc
md"""
## Eg Fifteen puzzle

Every possibility of the tiles would be a vertices, and an action or move that change the configuration or changes state vertices is an edge.
"""

# ╔═╡ 9006b25c-502c-11eb-1555-89570a5dbcd0


# ╔═╡ f7bf2d46-502e-11eb-3a0d-37fdd69f6f7a
md"""
Application
- Cell phone networks
- GPS Navigation
- Traffic or subway network
- Internet Connectivity
- Guarini's puzzle: switching white knights with black knights in a 3X3 chess board and knights in the corners

"""

# ╔═╡ 888609f6-502c-11eb-3d44-8fa3b7a3ebbd
function mkTree(maxdepth::Int = 10, p::Float64 = 0.8, g::SimpleGraph = Graph(1), currhead::Int = 1)
    if (maxdepth <= 1) g
    else
       b = Binomial(2, p)
       nEdges = max(1, rand(b))
        for leaves in 1:nEdges
            add_vertex!(g)
            newnode = nv(g)
            add_edge!(g, currhead, newnode)
            mkTree(maxdepth-1, p, g, newnode)
        end
    end
    g
end

# ╔═╡ Cell order:
# ╠═2a4592b2-502c-11eb-03a0-757db81b78ab
# ╠═569d9456-502c-11eb-0c7c-f58cd18dfe88
# ╟─5b8f7484-5031-11eb-21eb-4b0253f2d6dc
# ╠═c1f15916-5031-11eb-2476-051e956b35fa
# ╠═c540dd8a-5031-11eb-02b0-bdb19c98ffc1
# ╠═7e20525a-5031-11eb-18ca-49a54f458d7b
# ╠═ebda4bd2-502e-11eb-153c-dfc4a041926c
# ╠═deb4fbd2-502e-11eb-097b-5b2cc713ffb3
# ╠═6aec3140-502c-11eb-0896-1f5543983ffc
# ╠═9006b25c-502c-11eb-1555-89570a5dbcd0
# ╠═f7bf2d46-502e-11eb-3a0d-37fdd69f6f7a
# ╠═888609f6-502c-11eb-3d44-8fa3b7a3ebbd
