tools
requestPathOfKind: aSymbolOrCollection for: aWorkingCopy purposeText: aStringOrText thenContinueWith: aUnaryBlock
	| version subPath |
	gitRepository repository
		workingCopyDirDo:
			[:workingCopyDir |
				^ self requestPathOfKind: aSymbolOrCollection
					for: aWorkingCopy
					purposeText: aStringOrText
					inDirectory: workingCopyDir
					thenContinueWith: aUnaryBlock]
		ifBareOrAbsent: ["choose from existing directories"
			version := aWorkingCopy baseVersion.
			version
				ifNil: ["nothing exists yet"
					subPath := UIManager default
						request: aStringOrText
						initialAnswer: ''.
					^ aUnaryBlock value: (self validatePath: subPath)]
				ifNotNil: [
					^ self requestPathOfKind: aSymbolOrCollection
						for: aWorkingCopy
						purposeText: aStringOrText
						inDirectory: (self workingTreeForCommitNamed: version hexHash) root
						thenContinueWith: aUnaryBlock]]