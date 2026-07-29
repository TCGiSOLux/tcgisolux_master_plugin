Scriptname DLC1DawnguardAttack6Attacker3Death extends ReferenceAlias  
{Script on Attacker3 alias in DLC1DawnguardAttack6 quest}

GlobalVariable Property DawnguardAttack6AttackersDeathCount Auto Conditional

Event OnDeath(Actor akKiller)
	if DawnguardAttack6AttackersDeathCount.Value < 3
	DawnguardAttack6AttackersDeathCount.SetValue(DawnguardAttack6AttackersDeathCount.GetValue() + 1)
	endif

	if DawnguardAttack6AttackersDeathCount.Value == 3
	Utility.Wait(5)
	DawnguardAttack6AttackersDeathCount.SetValue(0)
	GetOwningQuest().Stop()
	endif
EndEvent