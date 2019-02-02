choosing packages
chooseFor: aWorkingCopy

	| originalPackages addedPackages removedPackages |
	acceptChanges := false.
	trackedPackages := self packagesIn: aWorkingCopy.
	originalPackages := trackedPackages copy.
	self updateUntrackedPackages.
	
	ToolBuilder open: self.
	acceptChanges ifFalse: [^ self].
	
	removedPackages := originalPackages copyWithoutAll: self trackedPackages.
	addedPackages := self trackedPackages copyWithoutAll: originalPackages.
	(removedPackages isEmpty and: [addedPackages isEmpty]) ifTrue: [^ self].
	
	removedPackages do: [:each | aWorkingCopy removePackageNamed: each].
	addedPackages ifNotEmpty: [
		self requestPathInWorkingCopy: aWorkingCopy
			thenContinue:
				[:path |
					addedPackages do: [:each | aWorkingCopy addPackageNamed: each at: path]]].