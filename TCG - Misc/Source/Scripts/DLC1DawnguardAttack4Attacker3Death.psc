Scriptname DLC1DawnguardAttack4Attacker3Death extends ReferenceAlias  
{Script on Attacker3 alias in DLC1DawnguardAttack4 quest}

GlobalVariable Property DawnguardAttack4AttackersDeathCount Auto Conditional

Event OnDeath(Actor akKiller)
	if DawnguardAttack4AttackersDeathCount.Value < 3
	DawnguardAttack4AttackersDeathCount.SetValue(DawnguardAttack4AttackersDeathCount.GetValue() + 1)
	endif

	if DawnguardAttack4AttackersDeathCount.Value == 3
	Utility.Wait(5)
	DawnguardAttack4AttackersDeathCount.SetValue(0)
	GetOwningQuest().Stop()
	endif
EndEvent