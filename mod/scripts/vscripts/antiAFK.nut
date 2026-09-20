global function antiAFK_Init

void function antiAFK_Init(){
	thread antiAFKLoop() // This should work everywhere including the lobby instead of only ingame
}

void function antiAFKLoop(){
	// Default time in s before you get kicked out of a pub match is 180 seconds
	for(;;){
		wait 60

		entity self = GetLocalClientPlayer()
		while( !IsValid( self ) || self == null )
			wait 0

		self.ClientCommand( "resetidletimer" )
	}
}