running
setUp
	super setUp.
	repository := GitRepository on: (FileSystem memory / 'repo')