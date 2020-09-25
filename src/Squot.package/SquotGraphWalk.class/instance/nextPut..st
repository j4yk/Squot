accessing
nextPut: anObject 
	"Remember to visit the given object during the walk"
	visited ifNotEmpty: [inverse addEdgeFrom: anObject to: visited last].
	((visited includes: anObject) or: [toBeVisited includes: anObject]) ifTrue: [^ self].
	toBeVisited add: anObject.