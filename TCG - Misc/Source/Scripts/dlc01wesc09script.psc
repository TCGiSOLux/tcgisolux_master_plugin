Scriptname DLC01WESC09Script extends ReferenceAlias  
{Script attached to Taron Dreth on WESC09. EVPs him more frequently to make sure his forcegreet fires}

bool loopActive = False
bool UNLOAD = False

Event OnLoad()
	if( !UNLOAD )
	loopActive = True
	RunLoop()
	EndIf
EndEvent

Event OnUnload()
	if( GetOwningQuest().GetStageDone(50) == 0 && !UNLOAD )
	loopActive = false
	UNLOAD = True
	GetOwningQuest().SetStage(100)
	endif
EndEvent

Event OnCellDetach()
	if( GetOwningQuest().GetStageDone(50) == 0 && !UNLOAD )
	loopActive = false
	UNLOAD = True
	GetOwningQuest().SetStage(100)
	endif
EndEvent

Function RunLoop()
	While (loopActive)
		if( GetOwningQuest().GetStageDone(50) == 0 && !self.GetActorReference().Is3DLoaded() && !UNLOAD )
			loopActive = False
		EndIf
		Utility.Wait(5)
		Self.TryToEvaluatePackage()
	EndWhile
EndFunction