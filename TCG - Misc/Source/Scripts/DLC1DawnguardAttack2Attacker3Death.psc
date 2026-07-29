Scriptname DLC1DawnguardAttack2Attacker3Death extends ReferenceAlias  
{Script on Attacker3 alias in DLC1DawnguardAttack2 quest}

GlobalVariable Property DawnguardAttack2AttackersDeathCount Auto Conditional

Event OnDeath(Actor akKiller)
	if DawnguardAttack2AttackersDeathCount.Value < 3
	DawnguardAttack2AttackersDeathCount.SetValue(DawnguardAttack2AttackersDeathCount.GetValue() + 1)
	endif

	if DawnguardAttack2AttackersDeathCount.Value == 3
	Utility.Wait(5)
	DawnguardAttack2AttackersDeathCount.SetValue(0)
	GetOwningQuest().Stop()
	endif
EndEvent