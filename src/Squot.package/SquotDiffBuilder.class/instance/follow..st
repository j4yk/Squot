as yet unclassified
follow: aPairOfShadows
	| leftShadow rightShadow baseShadow |
	leftShadow := aPairOfShadows key.
	rightShadow := aPairOfShadows value.
	rightShadow class == Association ifTrue:
		[baseShadow := leftShadow.
		leftShadow := rightShadow key.
		rightShadow := rightShadow value].
	leftShadow
		ifNil:
			["added object"
			(visited includes: rightShadow undecorated) ifTrue: [^ self].
			visited add: rightShadow undecorated.
			self followAddedObjectReferences: rightShadow]
		ifNotNil:
			["existing object"
			(visited includes: leftShadow undecorated) ifTrue: [^ self].
			visited add: leftShadow undecorated.
			diffedPair := aPairOfShadows.
			baseShadow
				ifNil: [self left: leftShadow right: rightShadow]
				ifNotNil: [self left: leftShadow right: rightShadow base: baseShadow]].