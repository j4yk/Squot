guiding
nextNodesAfter: anObject
	"Answer a collection of nodes that are reachable from anObject."
	^ anObject squotOutgoingReferences collect: [:each | each value]