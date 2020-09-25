accessing
neighborsOf: anObject
	^ neighbors at: anObject ifAbsentPut: [listFactory new]