Scriptname WEJS14AfflictedDeath extends ReferenceAlias  
{Script on AfflictedRefugee alias in WEJS14 quest}

Event OnDeath(Actor akKiller)
	if GetOwningQuest().GetStageDone(100) == 0
	GetOwningQuest().Stop()
	endif
EndEvent

Event OnUnload()
	if GetOwningQuest().GetStageDone(100) == 0
	GetOwningQuest().Stop()
	endif
EndEvent

Event OnCellDetach()
	if GetOwningQuest().GetStageDone(100) == 0
	GetOwningQuest().Stop()
	endif
EndEvent