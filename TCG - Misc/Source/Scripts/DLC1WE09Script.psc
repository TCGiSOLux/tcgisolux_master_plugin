Scriptname DLC1WE09Script extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	If GetOwningQuest().GetStageDone(10)
	GetOwningQuest().Stop()
	endif
EndEvent

Event OnUnload()
	If !GetOwningQuest().GetStageDone(10)
	GetOwningQuest().Stop()
	endif
EndEvent

Event OnCellDetach()
	If !GetOwningQuest().GetStageDone(10)
	GetOwningQuest().Stop()
	endif
EndEvent