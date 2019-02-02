tools
requestSubdirectoryOf: aDirectoryReference purposeText: aStringOrText thenContinueWith: aUnaryBlock	
	| fileDirectory chosenDirectory |
	fileDirectory :=
		aDirectoryReference fileSystem = FileSystem disk
			ifTrue: [(DirectoryChooserDialog
							openOn: aDirectoryReference asFileDirectory
							label: aStringOrText)]
			ifFalse: [SquitSubFolderList modalFolderSelector: (FSFileDirectoryAdapter on: aDirectoryReference)].
	fileDirectory ifNil: [^ nil].
	chosenDirectory := fileDirectory asFSReference.
	(chosenDirectory = aDirectoryReference
		or: [aDirectoryReference contains: chosenDirectory]) ifFalse: [^ self].
	^ aUnaryBlock value:
		(self validatePath: (SquotPath from:
			(chosenDirectory relativeTo: aDirectoryReference)))