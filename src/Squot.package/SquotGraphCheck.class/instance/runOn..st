initialize-release
runOn: aSquotShadowGraph
	graph := aSquotShadowGraph.
	walk := SquotGraphWalk guidedBy: SquotOutgoingReferencesGuide new.
	walk nextPut: aSquotShadowGraph startShadow.
	walk do: [:each | self check: each].