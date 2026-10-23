Scriptname DLC1WEDB04Script extends ReferenceAlias  

Event OnUnload()
	GetOwningQuest().Stop()
EndEvent

Event OnCellDetach()
	GetOwningQuest().Stop()
EndEvent