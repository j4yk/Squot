*Squot-Tools
requestPathOfKind: aSymbolOrCollection purposeText: aStringOrText thenContinueWith: aUnaryBlock
	^ self repository
		requestPathOfKind: aSymbolOrCollection
		for: self
		purposeText: aStringOrText
		thenContinueWith: aUnaryBlock