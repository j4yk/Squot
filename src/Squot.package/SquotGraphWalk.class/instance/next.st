accessing
next
	| next |
	[toBeVisited ifEmpty: [^ self error: 'No more objects'].
	next := toBeVisited removeFirst.
	visited includes: next]
		whileTrue.
	visited add: next.
	guide show: self nextAfter: next.
	^ next