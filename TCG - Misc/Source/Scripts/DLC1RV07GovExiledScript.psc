Scriptname DLC1RV07GovExiledScript extends ReferenceAlias  
{Script attached to Candidate alias in DLC1RV07}

Faction Property GovExiled auto

Event OnUpdate()
	if (GetActorReference().IsInFaction(GovExiled) == true)
		;Debug.Trace(self + "Candidate are now in exile, skipping candidate turning into vampire")
		GetOwningQuest().SetStage(350)
	endif
EndEvent