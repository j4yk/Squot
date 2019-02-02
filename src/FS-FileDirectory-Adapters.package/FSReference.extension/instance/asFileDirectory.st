*FS-FileDirectory-Adapters-converting
asFileDirectory
	^ FileDirectory on: (self path printWithDelimiter: FileDirectory pathNameDelimiter)