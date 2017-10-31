Squot-diff-testing
squotHasChanges
	^ chunks notEmpty and: [chunks size > 1 or: [chunks first isMemberOf: Diff3Conflict]]