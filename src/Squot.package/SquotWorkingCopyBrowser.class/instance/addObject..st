actions
addObject: anObject
	workingCopy
		requestPathOfKind: #(file directory)
		purposeText: 'Path in the working copy for the added object'
		thenContinueWith:
			[:path | workingCopy add: anObject at: path.
					self changed: #objectLabels].