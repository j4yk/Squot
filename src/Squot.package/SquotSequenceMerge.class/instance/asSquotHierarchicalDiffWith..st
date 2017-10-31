Squot-diff-converting
asSquotHierarchicalDiffWith: aDiffNodesBuilder
	| visitor |
	visitor := SquotSequenceMergeDiff3Visitor new.
	visitor sequencesLeft: left right: right base: base.
	visitor chunks: chunks.
	chunks do: [:each | each accept: visitor].
	^ visitor nodes