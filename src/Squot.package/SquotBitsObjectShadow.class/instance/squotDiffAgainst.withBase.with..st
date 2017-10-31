Squot-shadow-diffing
squotDiffAgainst: otherBitsShadow withBase: baseBitsShadow with: aDiffBuilder
	^ aDiffBuilder diffFrom: self to: otherBitsShadow basedOn: baseBitsShadow
		ifNew: [SquotSequenceMerge
				left: self value
				right: otherBitsShadow value
				base: baseBitsShadow value]
		andInitialize: []