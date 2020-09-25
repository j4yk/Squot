printing
printOn: aStream
	super printOn: aStream.
	problems isEmpty
		ifTrue: [aStream nextPutAll: ' without problems']
		ifFalse: [aStream nextPutAll: ' with '; nextPutAll: problems size printString; nextPutAll: ' problems'].