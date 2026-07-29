Scriptname DLC1DawnguardAttack1AttackerDeath extends ReferenceAlias  
{Script on Attacker1 alias in DLC1DawnguardAttack1 quest}

Event OnDeath(Actor akKiller)
	Utility.Wait(4)
	GetOwningQuest().Stop()
EndEvent