Scriptname DLC1DawnguardAttack3Attacker2Death extends ReferenceAlias  
{Script on Attacker2 alias in DLC1DawnguardAttack3 quest}

GlobalVariable Property DawnguardAttack3AttackersDeathCount Auto Conditional

Event OnDeath(Actor akKiller)
	if DawnguardAttack3AttackersDeathCount.Value < 2
	DawnguardAttack3AttackersDeathCount.SetValue(DawnguardAttack3AttackersDeathCount.GetValue() + 1)
	endif

	if DawnguardAttack3AttackersDeathCount.Value == 2
	Utility.Wait(5)
	DawnguardAttack3AttackersDeathCount.SetValue(0)
	GetOwningQuest().Stop()
	endif
EndEvent