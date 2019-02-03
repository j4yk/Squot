ston
stonAllInstVarNames
	"Do not store the delegateRegistry in STON"
	^ super stonAllInstVarNames copyWithout: 'delegateRegistry'