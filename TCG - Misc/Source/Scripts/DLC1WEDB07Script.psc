Scriptname DLC1WEDB07Script extends ReferenceAlias  

ReferenceAlias Property Actor1  Auto  
ReferenceAlias Property Actor2  Auto  
ReferenceAlias Property Actor3  Auto  
ReferenceAlias Property Actor4  Auto  
ReferenceAlias Property Actor5  Auto  

Event OnDeath(Actor akKiller)
	If (Actor1.GetActorReference().IsDead()) && (Actor2.GetActorReference().IsDead()) && (Actor5.GetActorReference().IsDead())
	;Dawnguard win, make shutdown this quest
	GetOwningQuest().Stop()
	endif

	If (Actor3.GetActorReference().IsDead()) && (Actor4.GetActorReference().IsDead()) && (Actor5.GetActorReference().IsDead())
	;Vampires win, make shutdown this quest
	GetOwningQuest().Stop()
	endif
EndEvent

Event OnUnload()
	;Vampires, Dawnguard and Dragons are unloaded. Make shutdown this quest
	GetOwningQuest().Stop()
EndEvent

Event OnCellDetach()
	;Vampires, Dawnguard and Dragons are unloaded. Make shutdown this quest
	GetOwningQuest().Stop()
EndEvent