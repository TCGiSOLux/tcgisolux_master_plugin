Scriptname DLC1WERJ05_SetupRelationScript extends Quest  

Faction Property DLC1WERJ05Faction auto

Faction[] Property AllyFactions auto
Faction[] Property FriendFactions auto
Faction[] Property EnemyFactions auto
Faction[] Property NeutralFactions auto

Event OnInit()

	ProcessArrays()

EndEvent

Function ProcessArrays()
	int currentElement = 0
   	while (currentElement < AllyFactions.Length)
    	AllyFactions[currentElement].SetAlly(DLC1WERJ05Faction)
    	currentElement += 1
   	endWhile

	CurrentElement = 0
	while (currentElement < FriendFactions.Length)
		FriendFactions[currentElement].SetAlly(DLC1WERJ05Faction, true, true)
		currentElement += 1
	endWhile
	
	CurrentElement = 0
	while (currentElement < EnemyFactions.Length)
		EnemyFactions[currentElement].SetEnemy(DLC1WERJ05Faction)
		currentElement += 1
	endWhile

	CurrentElement = 0
	while (currentElement < NeutralFactions.Length)
		NeutralFactions[currentElement].SetEnemy(DLC1WERJ05Faction, true, true)
		currentElement += 1
	endWhile
EndFunction