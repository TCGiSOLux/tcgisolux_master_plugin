Scriptname TCGInitLoad extends ReferenceAlias

Race Property DremoraRace Auto
Race Property SnowElfRace Auto
Formlist Property HairColorList Auto
Formlist Property HeadPartsHuman Auto
Formlist Property HeadPartsAllRacesMinusBeast Auto
Formlist Property HeadPartsAllRacesMinusBeastVampires Auto
Formlist Property WerewolfHateFactions Auto
Faction Property WarlockFaction  Auto
Faction Property ForswornFaction  Auto
Faction Property ForswornDogFaction  Auto
Faction Property HagravenFaction  Auto
Faction Property PlayerFaction  Auto
Faction Property BanditFaction  Auto
Faction Property VampireFaction  Auto
Faction Property FalmerFaction  Auto
Faction Property DragonFaction  Auto  
Faction Property DLC1VampireFaction  Auto
Faction Property DLC1VampireCrimeFaction  Auto
Faction[] Property NeutralDragoniaFactions auto
Faction[] Property NeutralDraeneiFactions auto
Faction[] Property EnemyDraeneiCorruptedFactions auto
Faction[] Property EnemyDemoricaFactions auto
Faction[] Property FriendFactions auto
VoiceType Property DLC1FemaleVampire  Auto  
VoiceType Property FemaleUniqueMirabelleErvine  Auto  

bool Property DraeneiModInitialized Auto Hidden
bool Property FemaleCreaturesInitialized Auto Hidden
bool Property IDESpousesInitialized Auto Hidden
bool Property FDEAlvaInitialized Auto Hidden
bool Property DraeneiandFemaleCreaturesInitialized Auto Hidden
bool Property FDEAelaInitialized Auto Hidden
bool Property FDEBorgakhInitialized Auto Hidden
bool Property FDEJenassaInitialized Auto Hidden
bool Property IDEStormcloaksInitialized Auto Hidden
bool Property IDEDawnguardVigilantsInitialized Auto Hidden

Event OnPlayerLoadGame()
	Race playerRace = Game.GetPlayer().GetActorBase().GetRace()
	Faction TownMorthalFaction = Game.GetFormFromFile(0x0002817D, "Skyrim.esm") as Faction
	Actor Alva = Game.GetFormFromFile(0x0001AA5C, "Skyrim.esm") as Actor
	Actor Lami = Game.GetFormFromFile(0x0001AA61, "Skyrim.esm") as Actor
	Actor Hroggar = Game.GetFormFromFile(0x0001AA5D, "Skyrim.esm") as Actor
	Quest FemaleCreaturesSampleForm = Game.GetFormFromFile(0x00512924, "Female_Creatures.esp") as Quest ;BardSongsDUPLICATE001
	Quest IDESpousesSampleForm = Game.GetFormFromFile(0x000003B9, "IDE Spouses.esp") as Quest ;aaSPzNoGeneric1
	Quest FDEAlvaSampleForm = Game.GetFormFromFile(0x00000810, "FDE Alva.esp") as Quest ;aaAlva
	Quest pMS14 = Game.GetFormFromFile(0x00025F3E, "Skyrim.esm") as Quest
	FormList DLC1VampireHateFactions = Game.GetFormFromFile(0x0000989F, "Dawnguard.esm") as FormList
	Quest aaAlvaOther = Game.GetFormFromFile(0x00000025, "FDE Alva.esp") as Quest

	if (FDEAlvaSampleForm && !FDEAlvaInitialized)
		;-----------------------------------------------------------------------------------------------------
		; Initialize FDE Alva
		;-----------------------------------------------------------------------------------------------------
		FDEAlvaInitialized = True
		;-----------------------------------------------------------------------------------------------------
		; Adding Alva's factions to Werewolf hate factions
		;-----------------------------------------------------------------------------------------------------
		WerewolfHateFactions.AddForm(Game.GetFormFromFile(0x00000040, "FDE Alva.esp") as Faction )
		WerewolfHateFactions.AddForm(Game.GetFormFromFile(0x00000054, "FDE Alva.esp") as Faction )
		;-----------------------------------------------------------------------------------------------------
		; Set Factions
		;-----------------------------------------------------------------------------------------------------
		(Game.GetFormFromFile(0x00000040, "FDE Alva.esp") as Faction).SetAlly(PlayerFaction)
		(Game.GetFormFromFile(0x00000040, "FDE Alva.esp") as Faction).SetEnemy(VampireFaction, true, true)
		;-----------------------------------------------------------------------------------------------------
		; Restore Alva's aggression
		;-----------------------------------------------------------------------------------------------------
		if Alva.IsDead() && !pMS14.IsRunning()
		Alva.Reset()
		Alva.SetAV( "aggression", 1 )
		endif
		;-----------------------------------------------------------------------------------------------------
		; CHANGE MS14 QUEST
		;-----------------------------------------------------------------------------------------------------
		if pMS14.IsRunning() && pMS14.GetStage() >= 95 && pMS14.GetStage() < 116
		Alva.Disable()
		endif
	EndIf

	if (FDEAlvaSampleForm && FDEAlvaInitialized)

	if !FDEAlvaSampleForm.GetStageDone(130) && pMS14.GetStageDone(200) && FDEAlvaSampleForm.GetStage() < 4
	Alva.SetAV( "aggression", 1 )
	Alva.SetAV( "assistance", 2 )
	endif

	if !FDEAlvaSampleForm.GetStageDone(130) && Alva.IsInFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction) && Alva.IsInFaction(DLC1VampireCrimeFaction)
	Utility.Wait(2)
	Alva.RemoveFromFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
	Alva.SetCrimeFaction(DLC1VampireCrimeFaction)
	endif

	if aaAlvaOther.GetStageDone(20) && Alva.IsInFaction(DLC1VampireFaction)
	Alva.SetAV( "aggression", 1 )
	Alva.SetAV( "confidence", 4 )
	Alva.SetAV( "assistance", 2 )
	Alva.SetOutfit(Game.GetFormFromFile(0x0000677E, "Dawnguard.esm") as Outfit)
	Alva.RemoveFromFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
	Utility.Wait(1)
	Alva.AddToFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
	Alva.SetCrimeFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
	Alva.AddToFaction(DLC1VampireCrimeFaction)
	Utility.Wait(5)
	Alva.RemoveFromFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
	Alva.SetCrimeFaction(DLC1VampireCrimeFaction)
	endif

	endif

	if (IDESpousesSampleForm && !IDESpousesInitialized)
		;Initialize IDE Spouses.
		IDESpousesInitialized = True
		Formlist HFVoiceRoughF = Game.GetFormFromFile( 0x00000009, "IDE Spouses.esp" ) as Formlist
		HFVoiceRoughF.AddForm(FemaleUniqueMirabelleErvine)
		HFVoiceRoughF.AddForm(DLC1FemaleVampire)
	EndIf

	if (FemaleCreaturesSampleForm && !FemaleCreaturesInitialized)
		;Initialize Female Monsters Of Skyrim (F.M.S.).
		FemaleCreaturesInitialized = True
		;--------------------------------------------------------------------------------------------------
		;| TCGiSOLux <-> Female Creatures Add Head Parts  | 
		;--------------------------------------------------------------------------------------------------
		HeadPartsHuman.AddForm(Game.GetFormFromFile(0x000345E2, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(SnowElfRace)
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x005C8EB5, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x005C8EB6, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x0004AB02, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x0004AB01, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x000345E3, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x001AF1E3, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x001AF1E2, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x0010D057, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x0010D058, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x0004AB00, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x0004AAFF, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x000324B8, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x0016D417, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(Game.GetFormFromFile(0x00005E52, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeast.AddForm(DremoraRace)
		HeadPartsAllRacesMinusBeastVampires.AddForm(Game.GetFormFromFile(0x000345E2, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeastVampires.AddForm(Game.GetFormFromFile(0x0004AB00, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeastVampires.AddForm(Game.GetFormFromFile(0x0004AB01, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeastVampires.AddForm(DremoraRace)
		HeadPartsAllRacesMinusBeastVampires.AddForm(Game.GetFormFromFile(0x0010D057, "Female_Creatures.esp") as Race )
		HeadPartsAllRacesMinusBeastVampires.AddForm(Game.GetFormFromFile(0x005C8EB5, "Female_Creatures.esp") as Race )
		;-----------------------------------------------------------------------------------------------------
		; Adding Monster Girl Home Cleanup Boss faction to Werewolf hate factions
		;-----------------------------------------------------------------------------------------------------
		WerewolfHateFactions.AddForm(Game.GetFormFromFile(0x005597BA, "Female_Creatures.esp") as Faction )
		;--------------------------------
		; Setting Factions
		;--------------------------------
		SetFactionsDragonia()
		SetFactionsDraeneiNonCorrupted()
		SetFactionsDraeneiCorrupted()
		SetFactionsDemoricaEnemy()
		SetFactionsDemoricaFriend()
		;Harpy Faction
		(Game.GetFormFromFile(0x001B9406, "Female_Creatures.esp") as Faction).SetEnemy(PlayerFaction, false, false)
		(Game.GetFormFromFile(0x001B9406, "Female_Creatures.esp") as Faction).SetAlly(HagravenFaction)
		(Game.GetFormFromFile(0x001B9406, "Female_Creatures.esp") as Faction).SetEnemy(WarlockFaction, true, true)
		(Game.GetFormFromFile(0x001B9406, "Female_Creatures.esp") as Faction).SetEnemy(ForswornFaction, true, true)
		(Game.GetFormFromFile(0x001B9406, "Female_Creatures.esp") as Faction).SetEnemy(ForswornDogFaction, true, true)
		;Dragonia Faction
		(Game.GetFormFromFile(0x0000ACF8, "Female_Creatures.esp") as Faction).SetAlly(DragonFaction, true, true)
		(Game.GetFormFromFile(0x0000ACF8, "Female_Creatures.esp") as Faction).SetEnemy(PlayerFaction, false, false)
		;Draenei Faction
		(Game.GetFormFromFile(0x00014FA2, "Female_Creatures.esp") as Faction).SetEnemy(BanditFaction, false, false)
		;Draenei Corrupted Faction
		(Game.GetFormFromFile(0x00042DF3, "Female_Creatures.esp") as Faction).SetEnemy(BanditFaction, false, false)
		(Game.GetFormFromFile(0x00042DF3, "Female_Creatures.esp") as Faction).SetAlly(FalmerFaction, true, true)
		(Game.GetFormFromFile(0x00042DF3, "Female_Creatures.esp") as Faction).SetAlly(VampireFaction, true, true)
		;Demorica Faction
		(Game.GetFormFromFile(0x00014FA5, "Female_Creatures.esp") as Faction).SetEnemy(FalmerFaction, true, true)
		;Monster Dolls Faction
		(Game.GetFormFromFile(0x0042436B, "Female_Creatures.esp") as Faction).SetAlly(PlayerFaction)
		(Game.GetFormFromFile(0x0042436B, "Female_Creatures.esp") as Faction).SetAlly(Game.GetFormFromFile(0x00048310, "Female_Creatures.esp") as Faction)
		(Game.GetFormFromFile(0x0042436B, "Female_Creatures.esp") as Faction).SetAlly(Game.GetFormFromFile(0x00540297, "Female_Creatures.esp") as Faction)
		;Monster Dolls Home Workers Faction
		(Game.GetFormFromFile(0x00540297, "Female_Creatures.esp") as Faction).SetAlly(PlayerFaction, true, true)
		;Monster Dolls Home Cleanup Boss Faction
		(Game.GetFormFromFile(0x005597BA, "Female_Creatures.esp") as Faction).SetAlly(Game.GetFormFromFile(0x00540297, "Female_Creatures.esp") as Faction, true, true)
		(Game.GetFormFromFile(0x005597BA, "Female_Creatures.esp") as Faction).SetAlly(PlayerFaction)
		(Game.GetFormFromFile(0x005597BA, "Female_Creatures.esp") as Faction).SetEnemy(Game.GetFormFromFile(0x0042436B, "Female_Creatures.esp") as Faction, false, false)
		(Game.GetFormFromFile(0x005597BA, "Female_Creatures.esp") as Faction).SetEnemy(Game.GetFormFromFile(0x00048310, "Female_Creatures.esp") as Faction, false, false)
		;Mermaid Faction
		;--------------------------------
		; Add Faction
		;--------------------------------
		Race MothRace = Game.GetFormFromFile( 0x005C8EB5, "Female_Creatures.esp" ) as Race
		Race MothRaceVampire = Game.GetFormFromFile( 0x005C8EB6, "Female_Creatures.esp" ) as Race
		Race MermaidRaceA = Game.GetFormFromFile( 0x000345E2, "Female_Creatures.esp" ) as Race
		Race MermaidRaceAVampire = Game.GetFormFromFile( 0x0004AB02, "Female_Creatures.esp" ) as Race
		Race MermaidRaceB = Game.GetFormFromFile( 0x0004AB01, "Female_Creatures.esp" ) as Race
		Race MermaidRaceBVampire = Game.GetFormFromFile( 0x000345E3, "Female_Creatures.esp" ) as Race
		if playerRace == MothRace || MothRaceVampire
		Game.GetPlayer().AddToFaction(Game.GetFormFromFile( 0x005EC631, "Female_Creatures.esp" ) as Faction)
		(Game.GetFormFromFile( 0x005EC631, "Female_Creatures.esp" ) as Faction).SetAlly(PlayerFaction, true, true)
		elseif playerRace == MermaidRaceA || MermaidRaceAVampire || MermaidRaceB || MermaidRaceBVampire
		Game.GetPlayer().AddToFaction(Game.GetFormFromFile(0x00048310, "Female_Creatures.esp") as Faction)
		endif
		;--------------------------------
		; Inject NPCs
		;--------------------------------

	EndIf

	if Game.IsPluginInstalled("FDE Aela.esp") && Game.IsPluginInstalled("FDE Aela Part 2.esp") && Game.IsPluginInstalled("FDE Aela Part 3.esp") && !FDEAelaInitialized
	FDEAelaInitialized = True
	;-----------------------------------------------------------------------------------------------------
	; Adding faction to Vampire hate factions
	;-----------------------------------------------------------------------------------------------------
	DLC1VampireHateFactions.AddForm(Game.GetFormFromFile(0x00002167, "FDE Aela Part 3.esp") as Faction)
	;-----------------------------------------------------------------------------------------------------
	; Setting Aela's factions
	;-----------------------------------------------------------------------------------------------------
	(Game.GetFormFromFile(0x00001AEA, "FDE Aela Part 2.esp") as Faction).SetEnemy(PlayerFaction, false, false)
	(Game.GetFormFromFile(0x000020D7, "FDE Aela Part 3.esp") as Faction).SetEnemy(PlayerFaction, true, true)
	(Game.GetFormFromFile(0x00002167, "FDE Aela Part 3.esp") as Faction).SetEnemy(PlayerFaction, true, true)
	(Game.GetFormFromFile(0x0000226B, "FDE Aela Part 3.esp") as Faction).SetEnemy(Game.GetFormFromFile(0x000AA0A4, "Skyrim.esm") as Faction, true, true)
	(Game.GetFormFromFile(0x0000246E, "FDE Aela Part 3.esp") as Faction).SetEnemy(PlayerFaction, true, true)
	endif
	
	if Game.IsPluginInstalled("FDE Borgakh.esp") && !FDEBorgakhInitialized
	FDEBorgakhInitialized = True
	(Game.GetFormFromFile(0x00008A63, "FDE Borgakh.esp") as Faction).SetEnemy(Game.GetFormFromFile(0x0002C005, "Skyrim.esm") as Faction, true, true)
	endif
	
	if Game.IsPluginInstalled("FDE Jenassa.esp") && Game.IsPluginInstalled("FDE Jenassa Part 2.esp") && !FDEJenassaInitialized
	FDEJenassaInitialized = True
	(Game.GetFormFromFile(0x0000A1F5, "FDE Jenassa Part 2.esp") as Faction).SetAlly(PlayerFaction)
	endif
	
	if Game.IsPluginInstalled("IDE Stormcloaks.esp") && !IDEStormcloaksInitialized
	IDEStormcloaksInitialized = True
	(Game.GetFormFromFile(0x00003A41, "IDE Stormcloaks.esp") as Faction).SetAlly(PlayerFaction)
	(Game.GetFormFromFile(0x00003A41, "IDE Stormcloaks.esp") as Faction).SetEnemy(Game.GetFormFromFile(0x00039f26, "Skyrim.esm") as Faction, false, false)
	endif
	
	if Game.IsPluginInstalled("IDE Dawnguard Vigilants.esp") && !IDEDawnguardVigilantsInitialized
	IDEDawnguardVigilantsInitialized = true
	(Game.GetFormFromFile(0x000000E9, "IDE Dawnguard Vigilants.esp") as Faction).SetEnemy(PlayerFaction, false, false)
	(Game.GetFormFromFile(0x000000E9, "IDE Dawnguard Vigilants.esp") as Faction).SetEnemy(Game.GetFormFromFile(0x000B3292, "Skyrim.esm") as Faction, false, false)
	endif

EndEvent

Function SetFactionsDragonia()
	Faction DragoniaFaction = Game.GetFormFromFile(0x0000ACF8, "Female_Creatures.esp") as Faction

	int cfb = 0
	while (cfb < NeutralDragoniaFactions.length)
		DragoniaFaction.SetEnemy(NeutralDragoniaFactions[cfb], true, true)
		cfb += 1
	endwhile
EndFunction

Function SetFactionsDraeneiNonCorrupted()
	Faction DraeneiFaction = Game.GetFormFromFile(0x00014FA2, "Female_Creatures.esp") as Faction

	int tcgiso = 0
	while (tcgiso < NeutralDraeneiFactions.length)
		DraeneiFaction.SetEnemy(NeutralDraeneiFactions[tcgiso], true, true)
		tcgiso += 1
	endwhile
EndFunction

Function SetFactionsDraeneiCorrupted()
	Faction DraeneiCorruptedFaction = Game.GetFormFromFile(0x00042DF3, "Female_Creatures.esp") as Faction

	int fcb = 0
	while (fcb < EnemyDraeneiCorruptedFactions.length)
		DraeneiCorruptedFaction.SetEnemy(EnemyDraeneiCorruptedFactions[fcb], false, false)
		fcb += 1
	endwhile
EndFunction

Function SetFactionsDemoricaEnemy()
	Faction DemoricaFaction = Game.GetFormFromFile(0x00014FA5, "Female_Creatures.esp") as Faction

	int agx = 0
	while (agx < EnemyDemoricaFactions.length)
		DemoricaFaction.SetEnemy(EnemyDemoricaFactions[agx], false, false)
		agx += 1
	endwhile
EndFunction

Function SetFactionsDemoricaFriend()
	Faction DemoricaFaction = Game.GetFormFromFile(0x00014FA5, "Female_Creatures.esp") as Faction

	int netshow = 0
	while (netshow < FriendFactions.length)
		DemoricaFaction.SetAlly(FriendFactions[netshow], true, true)
		netshow += 1
	endwhile
EndFunction
