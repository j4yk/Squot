tools
requestFileInDirectory: aDirectoryReference purposeText: aStringOrText thenContinueWith: aUnaryBlock
	| fileDirectory chosenFile |
	fileDirectory :=
		aDirectoryReference fileSystem = FileSystem disk
			ifTrue: [aDirectoryReference resolve:
						((FileSaverDialog
							openOn: aDirectoryReference asFileDirectory
							initialFilename: nil
							label: aStringOrText) ifNil: [^ self])]
			ifFalse: [SquitSubFolderList modalFolderSelector: (FSFileDirectoryAdapter on: aDirectoryReference)].
	fileDirectory ifNil: [^ nil].
	chosenFile := fileDirectory asFSReference.
	(chosenFile = aDirectoryReference
		or: [aDirectoryReference contains: chosenFile]) ifFalse: [^ self].
	^ aUnaryBlock value:
		(self validatePath: (SquotPath from:
			(chosenFile relativeTo: aDirectoryReference)))