Scriptname DLC1RV11JarlScript extends ReferenceAlias  
{Script attached to Jarl alias in DLC1RV11}

Faction Property JobJarlFaction auto

Event OnUpdate()
	if (GetActorReference().IsInFaction(JobJarlFaction) == false)
		;Debug.Trace(self + "Jarl no longer in JobJarlFaction, ending quest")
		GetOwningQuest().SetStage(300)
	endif
EndEvent