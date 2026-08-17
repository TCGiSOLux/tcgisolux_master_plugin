Scriptname MS14AlvaandHroggarScript extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Location Joylashuv1 = Game.GetFormFromFile(0x0001EB8E, "Skyrim.esm" ) as Location
	Location Joylashuv2 = Game.GetFormFromFile(0x0001BDFC, "Skyrim.esm" ) as Location

	If akNewLoc == Joylashuv1 || akNewLoc == Joylashuv2
		Alva.GetActorReference().SetCrimeFaction(none)
		Hroggar.GetActorReference().SetCrimeFaction(none)
	Else
		Faction CrimeFaction = Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction
		Alva.GetActorReference().SetCrimeFaction(CrimeFaction)
		Hroggar.GetActorReference().SetCrimeFaction(CrimeFaction)
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