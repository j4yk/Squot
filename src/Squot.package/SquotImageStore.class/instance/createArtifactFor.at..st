private
createArtifactFor: anObject at: aPath
	^ SquotArtifact new
		path: aPath;
		initializeDefaultStoreInfoFor: anObject;
		yourself