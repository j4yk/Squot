accessing
selectedObjectIndex: anObject

	selectedObjectIndex := anObject.
	self changed: #selectedObjectIndex;
		changed: #isAnyArtifactSelected.