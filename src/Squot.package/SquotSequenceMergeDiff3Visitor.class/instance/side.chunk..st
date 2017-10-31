visiting
side: aSymbol chunk: aDiff3Chunk
	aSymbol == #original ifTrue:
		[^ self detectRemovalBefore: aDiff3Chunk].
	nodesStream nextPut:
		(SquotDiffNode title: 'difference'
			content: (SquotSequenceDiffChunk new
				left: (self extractOriginalChunk: aDiff3Chunk);
				right: (aDiff3Chunk extractFrom: (self instVarNamed: aSymbol));
				yourself)
			children: #()).