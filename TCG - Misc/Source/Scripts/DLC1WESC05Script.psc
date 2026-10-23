Scriptname DLC1WESC05Script extends ObjectReference  
{When the player or spouse are moves in range, the Dawnguard Vampire Hunters teleports into them.}

ReferenceAlias property SceneCenterMarker Auto
ReferenceAlias property Spouse Auto
ReferenceAlias property Dawnguard01 Auto
ReferenceAlias property Dawnguard02 Auto
ReferenceAlias property Dawnguard03 Auto
Quest property DLC1_WESC05 Auto
bool YUKLANMAGAN = False

Event OnLoad()

	While (DLC1_WESC05.GetStage() == 0)
		if (SceneCenterMarker.GetReference().GetDistance(Game.GetPlayer()) < 2000) ||  (SceneCenterMarker.GetReference().GetDistance(Spouse.GetActorRef()) < 2000)
			Dawnguard01.TryToEnable()
			Dawnguard02.TryToEnable()
			Dawnguard03.TryToEnable()
			DLC1_WESC05.SetStage(5)
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
	DLC1_WESC05.SetStage(110)
EndFunction