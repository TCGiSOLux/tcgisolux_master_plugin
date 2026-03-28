Scriptname DLC1RV13LetterScript extends ReferenceAlias  
{Script attached to Letter alias in TCGDLC1RV13}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		;Debug.Trace(self + "OnContainerChanged() Letter added to player, setting stage 100")
		GetOwningQuest().setStage(50)
	endif
EndEvent