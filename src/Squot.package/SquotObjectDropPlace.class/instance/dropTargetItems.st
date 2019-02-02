ui
dropTargetItems
	^ droppedObject
		ifNil: [#('<Drop an object from an Inspector or ObjectExplorer here>')]
		ifNotNil: [Array with: droppedObject]