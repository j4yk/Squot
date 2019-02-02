actions
addObject
	| dropPlace |
	dropPlace := SquotObjectDropPlace new
		titleText: 'Drop an object here to add it';
		acceptText: 'Add to ', workingCopy name;
		cancelText: 'Cancel';
		receiver: self;
		receiverAcceptSelector: #addObject:;
		yourself.
	ToolBuilder open: dropPlace.