Scriptname DLC1RV12DawnguardScript extends ReferenceAlias  
{Script attached to Dawnguard alias in TCGDLC1RV12}

Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(60)
EndEvent