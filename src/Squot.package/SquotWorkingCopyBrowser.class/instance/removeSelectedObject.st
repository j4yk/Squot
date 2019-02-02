actions
removeSelectedObject
	workingCopy removeAt: self selectedObject path.
	selectedObjectIndex > self artifactsList size
		ifTrue: [self selectedObjectIndex: 0].
	self changed: #objectLabels.