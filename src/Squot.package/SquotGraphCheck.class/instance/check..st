private
check: aSquotObjectShadow 
	aSquotObjectShadow squotOutgoingReferences do:
		[:eachRef |
		(graph includes: eachRef value undecorated) ifFalse:
			[eachRef value hasSquotShadowName ifTrue:
				 [problems add:
					{#staleReference. aSquotObjectShadow. eachRef.
						(graph shadowNamed: eachRef value name)}]]]