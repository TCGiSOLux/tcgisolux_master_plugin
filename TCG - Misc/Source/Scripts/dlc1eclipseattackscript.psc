Scriptname DLC1EclipseAttackScript extends Quest  

DLC1RadiantScript Property DLC1Radiant  Auto  

ReferenceAlias[] Property SpawnPointAliases auto
ReferenceAlias[] Property AttackerAliases auto

GlobalVariable property GameDaysPassed auto
GlobalVariable property DLC1EclipseAttackNextWait auto  ;next allowed is today + This
GlobalVariable property DLC1EclipseAttackNextAllowed auto ;today + NextWait

GlobalVariable property DLC1EclipseAttackNextChanceEclipse auto ;starts at 100, then drops to 25
GlobalVariable property DLC1EclipseAttackNextChanceNight auto ;starts at 100, then drops to 5

GlobalVariable property DLC1EclipseAttackNextGauranteed auto ;next time we should make sure this happens - today + NextMaxWait
GlobalVariable property DLC1EclipseAttackNextMaxWait auto ;today + this

GlobalVariable Property DLC1EclipseActive auto

Quest Property DLC1VQ01MiscObjective auto

GlobalVariable Property DLC1EclipseAttackGuardHellos  Auto  
{global to turn on guard hellos}

Function MoveAndEnableAttackersToFathestSpawnPointAlias()
	ObjectReference FarthestRefFromPlayer = GetFarthestAliasFromPlayer()
	Location AttackLoc = FarthestRefFromPlayer.GetEditorLocation()
	Location MorthalLocation = Game.GetFormFromFile( 0x00018A53, "Skyrim.esm" ) as Location
	Location WhiterunLocation = Game.GetFormFromFile( 0x00018A56, "Skyrim.esm" ) as Location
	Location RiftenLocation = Game.GetFormFromFile( 0x00018A58, "Skyrim.esm" ) as Location
	Location WindhelmLocation = Game.GetFormFromFile( 0x00018A57, "Skyrim.esm" ) as Location
	Location SolitudeLocation = Game.GetFormFromFile( 0x00018A5A, "Skyrim.esm" ) as Location
	Location MarkarthLocation = Game.GetFormFromFile( 0x00018A59, "Skyrim.esm" ) as Location
	Quest MS05 = Game.GetFormFromFile( 0x00053511, "Skyrim.esm" ) as Quest
	Quest MS11 = Game.GetFormFromFile( 0x0001F7A3, "Skyrim.esm" ) as Quest
	Quest DB01 = Game.GetFormFromFile( 0x0001EA50, "Skyrim.esm" ) as Quest
	Quest MS01 = Game.GetFormFromFile( 0x00018B4B, "Skyrim.esm" ) as Quest
	Quest MS02 = Game.GetFormFromFile( 0x00040a5e, "Skyrim.esm" ) as Quest
	Quest SolitudeOpening = Game.GetFormFromFile( 0x000B2FD9, "Skyrim.esm" ) as Quest
	Quest RelationshipMarriage = Game.GetFormFromFile( 0x00074793, "Skyrim.esm" ) as Quest
	Quest MS01IntroWorldScene = Game.GetFormFromFile( 0x000AF75F, "Skyrim.esm" ) as Quest
	Quest MS01GuardScene = Game.GetFormFromFile( 0x000D66F2, "Skyrim.esm" ) as Quest
	Quest MS01ForswornScene = Game.GetFormFromFile( 0x000D6710, "Skyrim.esm" ) as Quest
	Quest MS01Ambush = Game.GetFormFromFile( 0x000210CD, "Skyrim.esm" ) as Quest
	Quest MS08Argue = Game.GetFormFromFile( 0x00055BFD, "Skyrim.esm" ) as Quest
	Quest DialogueWhiterun = Game.GetFormFromFile( 0x000270A4, "Skyrim.esm" ) as Quest
	Quest pMS14 = Game.GetFormFromFile(0x00025F3E, "Skyrim.esm") as Quest
	Actor Alva = Game.GetFormFromFile(0x0001AA5C, "Skyrim.esm") as Actor
	Quest AlvaQuest = Game.GetFormFromFile(0x00000810, "FDE Alva.esp") as Quest ; For FDE Alva MOD ONLY.
	Quest AlvaVolkiharCourt = Game.GetFormFromFile(0x00000025, "FDE Alva.esp") as Quest ; For FDE Alva MOD ONLY.
	Keyword CWOwner = Game.GetFormFromFile(0x0002A456, "Skyrim.esm") as Keyword ; For FDE Alva MOD ONLY.

	bool StopQuest = False

	if( MS01Ambush.GetStageDone(10) && !MS01Ambush.GetStageDone(100) )
		StopQuest = True
	EndIf

	if( AttackLoc == WindhelmLocation )
		if( MS11.IsRunning() || (DB01.IsRunning() && DB01.GetStage() < 20) )
			StopQuest = True
		EndIf
	ElseIf( AttackLoc == SolitudeLocation )
		if( SolitudeOpening.GetStage() < 20 )
			StopQuest = True
		EndIf
		if( MS05.GetStage() >= 150 && MS05.Getstage() < 300 )
			StopQuest = true
		endif
		if( AlvaQuest.GetStage() >= 5 && AlvaQuest.GetStage() < 119 && !AlvaVolkiharCourt.GetStageDone(20) )
			StopQuest = true
		endif
	ElseIf( AttackLoc == MarkarthLocation )
		if( !MS01IntroWorldScene.GetStageDone(500) )
			StopQuest = True
		EndIf
		if( MS01.GetStageDone(90) == 1 && !MS01.GetStageDone(95) )
			StopQuest = True
		EndIf
		if( MS01GuardScene.IsRunning() )
			StopQuest = True
		EndIf
		if( MS01ForswornScene.IsRunning() )
			StopQuest = True
		EndIf
		if( MS02.GetStageDone(80) == 1 && !MS02.GetStageDone(100) )
			StopQuest = True
		EndIf
		if( MS02.GetStageDone(200) == 1 && !MS02.GetStageDone(250) )
			StopQuest = True
		EndIf
	ElseIf( AttackLoc == RiftenLocation )
		if( RelationshipMarriage.GetStage() >= 20 && RelationshipMarriage.Getstage() < 99 )
			StopQuest = true
		endif
	ElseIf( AttackLoc == WhiterunLocation )
		if( MS08Argue.IsRunning() && DialogueWhiterun.Getstage() < 39 )
			StopQuest = true
		endif
	ElseIf( AttackLoc == MorthalLocation )
		if( pMS14.GetStageDone(95) && !pMS14.GetStageDone(97) )
			StopQuest = true
		endif
		if( AlvaQuest.GetStage() >= 5 && AlvaQuest.GetStage() < 119 )
			StopQuest = true
		endif
	EndIf
	
	if( StopQuest )
		DLC1EclipseAttackGuardHellos.SetValue(0)
		Stop()
		Return
	EndIf	
	
	;Debug.Trace(self + "MoveAndEnableAttackersToFathestSpawnPointAlias()")
	MoveAliasesToRef(FarthestRefFromPlayer)
EndFunction

objectReference Function GetFarthestAliasFromPlayer()
	int index = 0

	float farthestDistance
	ObjectReference farthestRef

	ObjectReference PlayerRef = Game.GetPlayer()

	while (index < SpawnPointAliases.Length)
		
		if SpawnPointAliases[index]
			ObjectReference currentRef = SpawnPointAliases[index].GetReference()
			if( currentRef != None ) ; Check to validate NONE objects added by UDGP 1.1.4
				float distance = currentRef.GetDistance(PlayerRef)

				if distance > farthestDistance
					farthestDistance = distance
					farthestRef = currentRef
				endif
			Else
				;debug.trace( "Spawn alias in slot " + index + " is a NONE object." )
			EndIf
		endif
		index += 1
	endwhile

	RETURN farthestRef

EndFunction

Function MoveAliasesToRef(ObjectReference RefToMoveTo)
	;Debug.Trace(self + "MoveAliasesToRef() AttackerAliases.Length == " + AttackerAliases.Length)
	int index = 0
		while (index < AttackerAliases.Length)
			;Debug.Trace(self + "MoveAliasesToRef() index: " + index + ", alias: " + AttackerAliases[index] + ", reference: " + AttackerAliases[index].GetReference())
			AttackerAliases[index].TryToEnable()
			index += 1
		endwhile	

EndFunction

function SetControllingGlobals()
	SetNextAllowed()
	SetNextChance()
	SetNextGauranteed()
EndFunction

Function SetNextAllowed()
EndFunction

Function SetNextChance()


	int NewChance

	if DLC1EclipseActive.GetValue() == 1
		NewChance = 100; starts game at 100 chance for Vampires, at 50 chance for Dawnguard
		DLC1EclipseAttackNextChanceEclipse.SetValue(NewChance)

	Else ;not an eclipse - just happening because its nighttime
		NewChance = 45; starts game at 100 chance for Vampires, at 50 chance for Dawnguard
		DLC1EclipseAttackNextChanceNight.SetValue(NewChance)

	endIf

EndFunction


Function SetNextGauranteed()		
EndFunction
