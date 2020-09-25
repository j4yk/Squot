initialize-release
initialize
	toBeVisited := OrderedCollection new.
	visited := OrderedCollection new.
	inverse := AdjacencyList newWithIdentityNodes.