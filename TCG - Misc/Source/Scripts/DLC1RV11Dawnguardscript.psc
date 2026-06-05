Scriptname DLC1RV11Dawnguardscript extends ReferenceAlias  
{Script attached to Vampire alias in DLC1RV11}

Event OnDeath(Actor akKiller)
	;Debug.Trace(self + "OnDeath() setting stage 100")
	GetOwningQuest().SetStage(100)
EndEvent