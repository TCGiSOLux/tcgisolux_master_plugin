Scriptname DLC1RadiantDDTravelerKilled extends ReferenceAlias  
{Script on Dawnguard alias in DLC1RadiantDisguisedDawnguardSpawner quest}

Event OnDeath(Actor akKiller)
	GetOwningQuest().Stop()
EndEvent