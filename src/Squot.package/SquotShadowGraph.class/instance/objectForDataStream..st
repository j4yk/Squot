objects from disk
objectForDataStream: aReferenceStream
	"Do not store the delegateRegistry to the data stream."
	^ (self class newFrom: self)
		delegateRegistry: nil;
		yourself