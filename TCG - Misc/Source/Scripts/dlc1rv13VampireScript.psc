Scriptname DLC1RV13VampireScript extends ReferenceAlias  
{Script attached to Vampire alias in TCGDLC1RV13}

Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(100)
EndEvent