instance creation
newWithIdentityNodes
	^ self new
		setNeighbors: IdentityDictionary new
		listFactory: OrderedCollection;
		yourself