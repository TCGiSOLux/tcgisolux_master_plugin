Scriptname WEDA02CultistScript extends ReferenceAlias  
import form 

quest property WEDA02 auto
book  property DA02book auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if akTarget == game.getPlayer() && GetOwningQuest().getstage() < 1
	GetOwningQuest().setstage(1)
	endif
endEvent

Event OnUnload()
	GetOwningQuest().Stop()
EndEvent

Event OnCellDetach()
	GetOwningQuest().Stop()
EndEvent

Event onDeath(Actor AkKiller)
	if akKiller == Game.GetPlayer()
	GetOwningQuest().setStage(10)
	GetOwningQuest().setObjectiveDisplayed(10,1)
	else
	GetOwningQuest().Stop()
	endif
endEvent

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
	GetOwningQuest().setStage(10)
	endif
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	if akBaseItem == DA02book
	GetOwningQuest().setStage(20)
	endif
endEvent
	