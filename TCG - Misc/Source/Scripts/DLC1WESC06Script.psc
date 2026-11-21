Scriptname DLC1WESC06Script extends ObjectReference  
{When the player are moves to Location Center Marker, Dawnguard Novice Hakar and Vampires are appears.}

ReferenceAlias property Dawnguard Auto
ReferenceAlias property LocationCenterMarker Auto
Quest property DLC1_WESC06 Auto
bool YUKLANMAGAN = False

Event OnLoad()

	While (DLC1_WESC06.GetStage() == 0)
		if (LocationCenterMarker.GetReference().GetDistance(Game.GetPlayer()) < 1024) 
			Dawnguard.TryToEnable()
			DLC1_WESC06.SetStage(2)
		Else
			Utility.Wait(1)
		EndIf
	EndWhile
EndEvent

Event OnUnload()
	if( !YUKLANMAGAN )
		CheckUnload()
	EndIf
EndEvent

Event OnCellDetach()
	if( !YUKLANMAGAN )
		CheckUnload()
	EndIf
EndEvent

Function CheckUnload()
	YUKLANMAGAN = True
	DLC1_WESC06.SetStage(100)
EndFunction