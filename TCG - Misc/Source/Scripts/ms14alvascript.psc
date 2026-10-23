Scriptname MS14AlvaScript extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Location Joylashuv1 = Game.GetFormFromFile(0x0001EB8E, "Skyrim.esm" ) as Location
	Location Joylashuv2 = Game.GetFormFromFile(0x0001BDFC, "Skyrim.esm" ) as Location
	Faction CrimeFaction = Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction

	If akNewLoc == Joylashuv1 || akNewLoc == Joylashuv2
		Alva.GetActorReference().RemoveFromFaction(CrimeFaction)
		Hroggar.GetActorReference().RemoveFromFaction(CrimeFaction)
		Alva.GetActorReference().SetCrimeFaction(none)
		Hroggar.GetActorReference().SetCrimeFaction(none)
	Else
		Alva.GetActorReference().AddtoFaction(CrimeFaction)
		Hroggar.GetActorReference().AddtoFaction(CrimeFaction)
		Utility.Wait(1)
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