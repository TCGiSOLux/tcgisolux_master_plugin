Scriptname DLC2WESC04Script extends ObjectReference  
{When the Player or Spouse are moves in range, the Bandit Assassin teleports to any them.}

ReferenceAlias property SceneCenterMarker Auto
ReferenceAlias property Spouse Auto
ReferenceAlias property Bandit Auto
Quest property DLC2_WESC04 Auto
bool YUKLANMAGAN = False

Event OnLoad()

	While (DLC2_WESC04.GetStage() == 0)
		if (SceneCenterMarker.GetReference().GetDistance(Game.GetPlayer()) < 1000) ||  (SceneCenterMarker.GetReference().GetDistance(Spouse.GetActorRef()) < 1000)
			DLC2_WESC04.SetStage(5)
			Bandit.TryToEnable()
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

	if (DLC2_WESC04.GetStageDone(100) == 0)
	DLC2_WESC04.SetStage(110)
	endif

EndFunction