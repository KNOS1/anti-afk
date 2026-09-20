global function antiAFK_Init

void function antiAFK_Init(){
	thread antiAFKLoop() // This should work everywhere including the lobby instead of only ingame
}

void function antiAFKLoop(){
	// Default time in s before you get kicked out of a pub match is 180 seconds
	// This is just playing it safe
	for(;;){
		wait 60

		// I dont actually know if its necessary to check whether the local client player is available or not
		// This is just playing it safe (again...)
		entity self = GetLocalClientPlayer()
		while( !IsValid( self ) || self == null )
			wait 0

		self.ClientCommand( "resetidletimer" )
	}
}