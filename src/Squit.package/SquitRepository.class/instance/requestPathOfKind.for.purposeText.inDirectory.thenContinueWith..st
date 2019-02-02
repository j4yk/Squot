tools
requestPathOfKind: aSymbolOrCollection for: aWorkingCopy purposeText: aStringOrText inDirectory: aDirectoryReference thenContinueWith: aUnaryBlock
	| allowedKinds |
	allowedKinds := aSymbolOrCollection isSymbol
		ifTrue: [Array with: aSymbolOrCollection]
		ifFalse: [aSymbolOrCollection].
	((allowedKinds includes: #directory) and: [(allowedKinds includes: #file) not])
		ifTrue: [^ self requestSubdirectoryOf: aDirectoryReference
					purposeText: aStringOrText
					thenContinueWith: aUnaryBlock].
	(allowedKinds includes: #file)
		ifTrue: [^ self requestFileInDirectory: aDirectoryReference
					purposeText: aStringOrText
					thenContinueWith: aUnaryBlock].
	self error: 'Unsupported kind of path requested'.