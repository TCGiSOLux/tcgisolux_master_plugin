Scriptname DLC1DawnguardAttack5Attacker2Death extends ReferenceAlias  
{Script on Attacker2 alias in DLC1DawnguardAttack5 quest}

GlobalVariable Property DawnguardAttack5AttackersDeathCount Auto Conditional

Event OnDeath(Actor akKiller)
	if DawnguardAttack5AttackersDeathCount.Value < 3
	DawnguardAttack5AttackersDeathCount.SetValue(DawnguardAttack5AttackersDeathCount.GetValue() + 1)
	endif

	if DawnguardAttack5AttackersDeathCount.Value == 3
	Utility.Wait(5)
	DawnguardAttack5AttackersDeathCount.SetValue(0)
	GetOwningQuest().Stop()
	endif
EndEvent