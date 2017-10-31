private
extractOriginalChunk: aDiff3Chunk
	"Extract the original sequence for an unconflicting chunk.
	Cases:
	1. it is the only chunk => full base
	2. it is the first chunk => next chunk is from original
	3. it is the last chunk => previous chunk is from original
	4. it is a middle chunk => neighboring chunks should be from original"
	chunks size == 1 ifTrue: [^ base].
	chunks first == aDiff3Chunk ifTrue: [^ base copyFrom: 1 to: chunks second offset - 1].
	chunks last == aDiff3Chunk ifTrue: [self halt.
		^ base
			copyFrom:
				(chunks at: chunks size - 1) offset + (chunks at: chunks size - 1) length
			to: base size].
	^ base
		copyFrom:
			(chunks before: aDiff3Chunk) offset + (chunks before: aDiff3Chunk) length
		to: (chunks after: aDiff3Chunk) offset - 1