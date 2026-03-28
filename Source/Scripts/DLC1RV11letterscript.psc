Scriptname DLC1RV11LetterScript extends ReferenceAlias  
{Script attaced to Letter alias in DLC1RV11}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		;Debug.Trace(self + "OnContainerChanged() setting stage 30")
		GetOwningQuest().SetStage(30)
	endif
EndEvent