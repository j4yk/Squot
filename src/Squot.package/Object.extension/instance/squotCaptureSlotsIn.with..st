*Squot-trackable-capturing
squotCaptureSlotsIn: anObjectShadow with: aCapturer
	self flag: #deprecated. "Use SquotObjectMirror>>initializeSnapshot: anObjectShadow of: self with: aCapturer instead."
	self squotRelevantInstVars do: [:each |
		anObjectShadow
			addInstVarNamed: each
			withValue: (self instVarNamed: each)
			with: aCapturer].
	(self class isVariable and: [self class isWeak not]) ifTrue:
		[1 to: self basicSize do: [:index |
			anObjectShadow
				addVariableSlotAt: index
				withValue: (self basicAt: index)
				with: aCapturer]].