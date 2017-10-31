testing
testConflictsInString
	| patch workingCopy rightVersion |
	workingCopy := SquotWorkingCopy newOnObjectMemory.
	workingCopy
		repository: SquotInMemoryRepository new;
		loadedHistorian: workingCopy repository defaultHistorian;
		add: 'this is a text with multiple words' copy at: 'text';
		saveNewVersionMessage: 'base version' interactive: false.
	(workingCopy objectAt: 'text')
		replaceFrom: 21 to: 28 with: 'many    ';
		replaceFrom: 1 to: 7 with: 'I am   '. "I am    a text with many    words"
	workingCopy saveNewVersionMessage: 'right version' interactive: false.
	rightVersion := workingCopy baseVersion.
	workingCopy loadVersion: rightVersion parents first interactive: false.
	self assert: 'this is a text with multiple words' equals: (workingCopy objectAt: 'text').
	self assert: 'I am a text with many words'
		equals: (rightVersion snapshot artifactAt: 'text')
			content startShadow value withBlanksCondensed.
	(workingCopy objectAt: 'text')
		replaceFrom: 21 to: 28 with: 'plentyof';
		replaceFrom: 11 to: 14 with: 'line'. "this is a line with plentyof words"
	patch := workingCopy
		patchForMergeWith: rightVersion
		basedOn: rightVersion parents first.
	self openToolAndTestOnPatch: patch.