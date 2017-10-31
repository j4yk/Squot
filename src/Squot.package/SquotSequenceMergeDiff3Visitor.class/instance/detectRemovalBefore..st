private
detectRemovalBefore: aDiff3Chunk
	chunks first == aDiff3Chunk ifTrue: [^ self].
	(((chunks before: aDiff3Chunk) respondsTo: #side) and: [(chunks before: aDiff3Chunk) side == #original]) ifTrue:
		[nodesStream nextPut:
			(SquotDiffNode title: 'removal'
				content: (SquotSequenceDiffChunk new
					left: (base copyFrom: (chunks before: aDiff3Chunk) offset + (chunks before: aDiff3Chunk) length to: aDiff3Chunk offset - 1);
					right: '';
					yourself)
				children: #())].