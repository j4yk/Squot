tools
validatePath: aString
	| path |
	path := aString.
	"remove leading directory separator if present"
	path ifNotEmpty:
		[path first = gitRepository repository baseDir fileSystem delimiter
			ifTrue: [path := path allButFirst]].
	"forbid the .git directory and .git* special files"
	(path beginsWith: '.git') ifTrue:
		[self error: 'Cannot use this path to store objects: ', path].
	^ path