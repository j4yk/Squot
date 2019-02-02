ui
dropObject: anObject
	droppedObject := anObject.
	self changed: #dropTargetItems;
		changed: #hasObject.