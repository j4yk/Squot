visiting
left: leftDiff3Chunk original: originalDiff3Chunk right: rightDiff3Chunk
	nodesStream nextPut:
		(SquotMergeDiffNode title: 'conflict'
			content: (SquotSequenceDiffConflict new
				left: (leftDiff3Chunk extractFrom: left);
				right: (rightDiff3Chunk extractFrom: right);
				base: (originalDiff3Chunk extractFrom: base);
				yourself)
			children: #()).