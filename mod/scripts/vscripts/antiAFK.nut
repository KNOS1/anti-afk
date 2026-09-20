global function antiAFK_Init

void function antiAFK_Init(){
	thread antiAFKLoop() // This should work everywhere including the lobby instead of only ingame
	thread AudioLoop()
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
int AfkTime = 0
bool Isplaying = false
array<int> AudioDurations = [
	28,
	21,
	13,
	15,
	24,
	34,
	23,
	35,
	27,
	106,
	45,
	35,
	226,
	152,
	187,
	148,
	197,
	157,
	208,
	117,
	125,
	172,
	141,
	164,
	226
]
void function AudioLoop(){
	for(;;){
		entity self = GetLocalClientPlayer()
		if (IsValid(self))
		{
			vector LastPosition = self.GetVelocity()
            wait 1
            if (LastPosition == self.GetVelocity())
			{
				AfkTime++
			}
			else AfkTime = 0

		}
		if (AfkTime >= 60 && !Isplaying && (GetMapName() != "mp_lobby") || AfkTime >= 500 && !Isplaying)
		{
			int randomIndex = RandomInt(25)
			self.ClientCommand("playvideo RainWorld" + randomIndex.tostring() + " 1 1")

			Isplaying = true
			thread Duration(randomIndex)
		}



     WaitFrame()

	}
}
void function Duration (int i) {
	    wait AudioDurations[i]
		Isplaying = false
}

