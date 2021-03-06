tests merging deprecated
testOldMergeWithConflictsChooseRemote
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeConflictScenario forTestCase: self.
	[[scenario oldMerge]
		on: SquotMergeRequested do: [:request |
			scenario
				assertConflictedMethodWorkingEditionPresentIn: request merge;
				assertConflictedMethodIncomingEditionPresentIn: request merge;
				assertThirdMethodWillBeAdded: request merge;
				chooseIncomingEditionOfConflictedMethodIn: request merge.
			request resume]]
		valueSupplyingAnswers: {{'*'. #default}}].
	scenario
		assertConflictMethodIncomingEditionLoaded;
		assertThirdMethodLoaded.
	"not saved yet"
	self assert: scenario secondVersion equals: workingCopy loadedVersion.