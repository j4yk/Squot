Squot-diff-converting
asSquotHierarchicalDiff
	^ diff diffIndices collect: [:each |
		SquotDiffNode title: 'diff chunk' content: each children: #()]