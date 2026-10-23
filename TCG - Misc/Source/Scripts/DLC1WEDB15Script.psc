Scriptname DLC1WEDB15Script extends ReferenceAlias  

Event OnUnload()
	GetOwningQuest().Stop()
EndEvent

Event OnCellDetach()
	GetOwningQuest().Stop()
EndEvent