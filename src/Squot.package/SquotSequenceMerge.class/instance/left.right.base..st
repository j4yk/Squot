initialize-release
left: leftSequence right: rightSequence base: baseSequence
	left := leftSequence.
	right := rightSequence.
	base := baseSequence.
	diff := Diff3 new
		diffClass: GenericDiff squotDiffClass;
		file0: base;
		file1: left;
		file2: right;
		yourself.
	chunks := diff mergeIndices.