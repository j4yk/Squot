choosing packages
requestPathInWorkingCopy: aWorkingCopy thenContinue: aUnaryBlock
	^ aWorkingCopy
		requestPathOfKind: #directory
		purposeText: 'Path in the working copy for the added packages'
		thenContinueWith: aUnaryBlock