Scriptname DLC2WESC07Script extends ReferenceAlias  

ReferenceAlias Property Actor1  Auto  
ReferenceAlias Property Actor2  Auto  
ReferenceAlias Property Actor3  Auto  
ReferenceAlias Property Actor4  Auto  
ReferenceAlias Property Actor5  Auto  
ReferenceAlias Property Actor6  Auto  
ReferenceAlias Property Actor7  Auto  
ReferenceAlias Property Actor8  Auto  
ReferenceAlias Property Actor9  Auto  
ReferenceAlias Property Actor10  Auto  

Event OnDeath(Actor akKiller)
	;VAMPIRES WINS
	If (Actor1.GetActorReference().IsDead()) && (Actor2.GetActorReference().IsDead()) && (Actor3.GetActorReference().IsDead()) && (Actor4.GetActorReference().IsDead()) && (Actor5.GetActorReference().IsDead())
	GetOwningQuest().Stop()
	endif

	;WEREWOLVES WINS
	If (Actor6.GetActorReference().IsDead()) && (Actor7.GetActorReference().IsDead()) && (Actor8.GetActorReference().IsDead()) && (Actor9.GetActorReference().IsDead()) && (Actor10.GetActorReference().IsDead())
	GetOwningQuest().Stop()
	endif
EndEvent

Event OnUnload()
	GetOwningQuest().Stop()
EndEvent

Event OnCellDetach()
	GetOwningQuest().Stop()
EndEvent