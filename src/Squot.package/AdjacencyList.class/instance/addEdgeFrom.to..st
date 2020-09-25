adding and removing
addEdgeFrom: originObject to: targetObject
	(self neighborsOf: originObject) add: targetObject.