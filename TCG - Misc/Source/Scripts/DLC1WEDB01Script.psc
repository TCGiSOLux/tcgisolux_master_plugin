Scriptname DLC1WEDB01Script extends ReferenceAlias  

ReferenceAlias Property Actor1  Auto  
ReferenceAlias Property Actor2  Auto  
ReferenceAlias Property Actor3  Auto  
ReferenceAlias Property Actor4  Auto  

Event OnDeath(Actor akKiller)
	If (Actor1.GetActorReference().IsDead()) && (Actor2.GetActorReference().IsDead()) && (Actor3.GetActorReference().IsDead())
	GetOwningQuest().Stop()
	endif

	If (Actor4.GetActorReference().IsDead())
	GetOwningQuest().Stop()
	endif
EndEvent

Event OnUnload()
	GetOwningQuest().Stop()
EndEvent

Event OnCellDetach()
	GetOwningQuest().Stop()
EndEvent