Scriptname DLC1WESC05Script extends ObjectReference  

ReferenceAlias property SceneCenterMarker Auto
ReferenceAlias property Spouse Auto
ReferenceAlias property Dawnguard01 Auto
ReferenceAlias property Dawnguard02 Auto
ReferenceAlias property Dawnguard03 Auto
bool YUKLANMAGAN = False

Event OnLoad()
	Quest DLC1_WESC05 = Game.GetFormFromFile( 0x000034DA, "Dawnguard.esm" ) as Quest

	While (DLC1_WESC05.GetStage() <= 4)
		if (SceneCenterMarker.GetReference().GetDistance(Game.GetPlayer()) > 1000) ||  (SceneCenterMarker.GetReference().GetDistance(Spouse.GetActorRef()) > 1000)
			Utility.Wait(1)
		Else
			Dawnguard01.GetActorRef().Enable()
			Dawnguard02.GetActorRef().Enable()
			Dawnguard03.GetActorRef().Enable()
			DLC1_WESC05.SetStage(5)
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
	Quest DLC1_WESC05 = Game.GetFormFromFile( 0x000034DA, "Dawnguard.esm" ) as Quest

	if (DLC1_WESC05.GetStageDone(100) == 0)
	DLC1_WESC05.SetStage(110)
	endif

EndFunction