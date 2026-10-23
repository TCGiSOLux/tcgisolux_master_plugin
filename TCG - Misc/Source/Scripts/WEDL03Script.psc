Scriptname WEDL03Script extends ObjectReference  
{When the player are moves to Travel Marker, Carvains and Bodyguard will appears.}

ReferenceAlias property TravelMaker1 Auto
ReferenceAlias property TravelMaker2 Auto
Quest property WEDL03 Auto
bool unloaded = False

Event OnLoad()

	While (WEDL03.GetStage() == 0)
		if (TravelMaker1.GetReference().GetDistance(Game.GetPlayer()) > 850) || (TravelMaker2.GetReference().GetDistance(Game.GetPlayer()) > 850) 
			Utility.Wait(1)
		Else
			WEDL03.SetStage(50)
		EndIf
	EndWhile
EndEvent

Event OnUnload()
	if( !unloaded )
		CheckUnload()
	EndIf
EndEvent

Event OnCellDetach()
	if( !unloaded )
		CheckUnload()
	EndIf
EndEvent

Function CheckUnload()
	unloaded = True
	if !WEDL03.getstagedone(100) || !WEDL03.getstagedone(200)
	WEDL03.SetStage(230)
	endif
EndFunction