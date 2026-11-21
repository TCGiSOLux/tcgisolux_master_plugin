Scriptname MS14AlvaScript extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	If akNewLoc == (Game.GetFormFromFile(0x0001EB8E, "Skyrim.esm" ) as Location) || akNewLoc == (Game.GetFormFromFile(0x0001BDFC, "Skyrim.esm" ) as Location)
		Alva.GetActorReference().RemoveFromFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
		Hroggar.GetActorReference().RemoveFromFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
		Alva.GetActorReference().SetCrimeFaction(none)
		Hroggar.GetActorReference().SetCrimeFaction(none)
	Else
		Alva.GetActorReference().AddtoFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
		Hroggar.GetActorReference().AddtoFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
		Utility.Wait(1)
		Alva.GetActorReference().SetCrimeFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
		Hroggar.GetActorReference().SetCrimeFaction(Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction)
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
    If GetOwningQuest().GetStage() == 80
        GetOwningQuest().SetStage(90)
    EndIf
    GetReference().UnregisterForUpdate()
EndEvent

ReferenceAlias Property Alva  Auto    
ReferenceAlias Property Hroggar  Auto  