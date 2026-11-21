Scriptname DLC2WESC04Script extends ObjectReference  
{When the player or spouse are moves to SceneCenterMarker, the Bandit Assassin teleports to any them.}

ReferenceAlias property SceneCenterMarker Auto
ReferenceAlias property Spouse Auto
ReferenceAlias property Bandit Auto
Quest property DLC2_WESC04 Auto
bool YUKLANMAGAN = False

Event OnLoad()

	While (DLC2_WESC04.GetStage() == 0)
		if (SceneCenterMarker.GetReference().GetDistance(Game.GetPlayer()) > 1000) ||  (SceneCenterMarker.GetReference().GetDistance(Spouse.GetActorRef()) > 1000)
			Utility.Wait(1)
		Else
			Bandit.TryToEnable()
			DLC2_WESC04.SetStage(5)
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
	DLC2_WESC04.SetStage(110)
EndFunction