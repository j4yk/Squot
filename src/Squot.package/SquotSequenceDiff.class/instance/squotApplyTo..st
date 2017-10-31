Squot-diff-patching
squotApplyTo: aSequence
	self flag: 'Check whether aSequence should not be a shadow and its value must be unwrapped.'.
	^ diff diff applyTo: aSequence