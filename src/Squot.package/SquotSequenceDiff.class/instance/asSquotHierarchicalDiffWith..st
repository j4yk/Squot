Squot-diff-converting
asSquotHierarchicalDiffWith: aDiffNodesBuilder
	^ chunks collect: [:each |
		SquotDiffNode
			title: 'difference'
			content: (SquotSequenceDiffChunk new
				left: each key;
				right: each value;
				diff: diff;
				yourself)
			children: #()]