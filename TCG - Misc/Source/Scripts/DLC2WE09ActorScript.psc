Scriptname DLC2WE09ActorScript extends ReferenceAlias  
{Script on DLC2WE09 actor aliases (cultists)}

Quest Property DLC2MQ01  Auto  

function setSearchObjective()
	if DLC2MQ01.GetStage() < 10
	GetOwningQuest().setStage(10) ;turns on the "Search the Cultist" objective
	endif
endfunction

Event OnUnload()
	if DLC2MQ01.GetStage() > 10
	GetOwningQuest().Stop()
	endif

	if !getowningquest().getstagedone(10)
	GetOwningQuest().Stop()
	endif
EndEvent

Event OnCellDetach()
	if DLC2MQ01.GetStage() > 10
	GetOwningQuest().Stop()
	endif

	if !getowningquest().getstagedone(10)
	GetOwningQuest().Stop()
	endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if akAggressor == Game.GetPlayer()
	setSearchObjective()
	endif
EndEvent

Event OnDeath(Actor akKiller)
	if GetReference().GetDistance(Game.GetPlayer()) < 2500
	setSearchObjective()
	endif
EndEvent