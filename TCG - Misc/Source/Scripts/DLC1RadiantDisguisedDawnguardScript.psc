Scriptname DLC1RadiantDisguisedDawnguardScript extends Quest  

Faction Property DawnguardDisguised auto
Faction Property DLC1VampireFaction auto
Faction[] Property AttackDisguisedDawnguard auto
Faction[] Property SetAllyToAttackDisguisedDawnguard auto

Function SetAllyFactionsToAttackDawnguardDisguised()
	int count1 = 0
	while (count1 < SetAllyToAttackDisguisedDawnguard.length)
		DLC1VampireFaction.SetAlly(SetAllyToAttackDisguisedDawnguard[count1])
		count1 += 1
	endwhile
EndFunction

Function DawnguardDisguisedStartCombat()
	int count2 = 0
	while (count2 < AttackDisguisedDawnguard.length)
		DawnguardDisguised.SetEnemy(AttackDisguisedDawnguard[count2])
		count2 += 1
	endwhile
EndFunction

Function DawnguardDisguisedDelete()
	int count3 = 0
	while (count3 < AttackDisguisedDawnguard.length)
		DawnguardDisguised.SetEnemy(AttackDisguisedDawnguard[count3], true, true)
		count3 += 1
	endwhile
EndFunction

Function SetNeutralFactionsToAttackDawnguardDisguised()
	int count4 = 0
	while (count4 < SetAllyToAttackDisguisedDawnguard.length)
		DLC1VampireFaction.SetEnemy(SetAllyToAttackDisguisedDawnguard[count4], true, true)
		count4 += 1
	endwhile
EndFunction