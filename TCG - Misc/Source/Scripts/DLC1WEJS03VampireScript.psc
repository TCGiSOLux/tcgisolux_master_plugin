Scriptname DLC1WEJS03VampireScript extends ReferenceAlias  

Event OnUnload()
	GetOwningQuest().Stop()
EndEvent

Event OnCellDetach()
	GetOwningQuest().Stop()
EndEvent