as yet unclassified
replaceObjectReferencesByNamesInDictionaryKeys: anIdentityDictionary
	| newAssociations |
	newAssociations := OrderedCollection new: anIdentityDictionary size.
	anIdentityDictionary keysAndValuesDo: [:object :value |
		newAssociations add: (SquotActiveObjectRegistry nameOf: object) -> value].
	^ Dictionary newFrom: newAssociations