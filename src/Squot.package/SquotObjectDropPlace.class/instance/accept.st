actions
accept
	self hasObject ifTrue:
		[accepted := true.
		receiver perform: receiverAcceptSelector with: droppedObject].
	self changed: #close.