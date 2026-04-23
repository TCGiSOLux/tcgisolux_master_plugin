Scriptname DLC1OneToManyFactionRelationScript extends Quest  
{Used to set One to Many Faction Relationships. Where TargetFaction needs to have the same kind of relationship to multiple factions, but those factions do not share the same relationship with each other.}

Faction Property TargetFaction auto
{Which faction's relationships are we setting?}

Faction Property TargetFaction2 auto
{Which faction's relationships are we setting?}

Faction[] Property AllyFactions auto
{TargetFaction will be made Allies of all factions in this array (and visa versa)}

Faction[] Property FriendFactions auto
{TargetFaction will be made Friends of all factions in this array (and visa versa)}

Faction[] Property EnemyFactions auto
{TargetFaction will be made Enemies of all factions in this array (and visa versa)}

Faction[] Property NeutralFactions auto
{TargetFaction will be made Beutral to all factions in this array (and visa versa)}



Event OnInit()

	ProcessArrays()

EndEvent

Function ProcessArrays()
	int currentElement = 0
   	while (currentElement < AllyFactions.Length)
    	AllyFactions[currentElement].SetAlly(TargetFaction)
    	AllyFactions[currentElement].SetAlly(TargetFaction2)
    	currentElement += 1
   	endWhile

	CurrentElement = 0
	while (currentElement < FriendFactions.Length)
		FriendFactions[currentElement].SetAlly(TargetFaction, true, true)
		FriendFactions[currentElement].SetAlly(TargetFaction2, true, true)
		currentElement += 1
	endWhile
	
	CurrentElement = 0
	while (currentElement < EnemyFactions.Length)
		EnemyFactions[currentElement].SetEnemy(TargetFaction)
		EnemyFactions[currentElement].SetEnemy(TargetFaction2)
		currentElement += 1
	endWhile

	CurrentElement = 0
	while (currentElement < NeutralFactions.Length)
		NeutralFactions[currentElement].SetEnemy(TargetFaction, true, true)
		NeutralFactions[currentElement].SetEnemy(TargetFaction2, true, true)
		currentElement += 1
	endWhile
EndFunction