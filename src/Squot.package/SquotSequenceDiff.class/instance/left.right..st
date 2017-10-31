initialize-release
left: leftSequence right: rightSequence
	left := leftSequence.
	right := rightSequence.
	diff := GenericDiff squotDiffClass new file1: left; file2: right; yourself.
	chunks := diff diffIndices.