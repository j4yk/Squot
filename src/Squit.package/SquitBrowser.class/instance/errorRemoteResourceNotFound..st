private
errorRemoteResourceNotFound: aGitRemoteError
	| message answer |
	message := 'No repository found at the remote URL. Maybe the URL is incorrect. Please check the remote configuration.'.
	aGitRemoteError responseBody ifNotEmpty: [
		message := message , String cr , 
			'The following might give a hint of what has happened:' , String cr , String cr, 
			(aGitRemoteError responseBody contractTo: 200), String cr].
	(answer := SquotGUI confirm: message trueChoice: 'OK' translated falseChoice: 'Debug')
		= false ifTrue: [ToolSet debugError: aGitRemoteError].
	answer = true "OK" ifTrue:
		[(SquitBadRemote remote: aGitRemoteError remote)
			cause: aGitRemoteError;
			signal].
	^ answer