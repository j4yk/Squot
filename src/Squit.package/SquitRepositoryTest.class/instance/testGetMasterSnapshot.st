tests
testGetMasterSnapshot
	| master masterSnapshot |
	squitRepository withUnitOfWork:
	[master := squitRepository historianNamed: 'master'.
	masterSnapshot := master version snapshot.
	self shouldnt: [masterSnapshot artifactAt: 'README.md'] raise: KeyNotFound.
	self assert: (SquotImageStore new restoreObjectFrom: (masterSnapshot artifactAt: 'README.md')) isString].