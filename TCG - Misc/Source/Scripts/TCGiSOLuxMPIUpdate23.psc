;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 23
Scriptname TCGiSOLuxMPIUpdate23 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE

;START UPDATE
;ACTOR
Actor Alva = Game.GetFormFromFile(0x0001AA5C, "Skyrim.esm") as Actor

;Factions
Faction VampireFaction = Game.GetFormFromFile(0x00027242, "Skyrim.esm") as Faction
Faction WEDL03Faction = Game.GetFormFromFile(0x000B91A7, "Skyrim.esm") as Faction
Faction WEDL05Faction = Game.GetFormFromFile(0x000B91B1, "Skyrim.esm") as Faction
Faction WEDL06LutreshFaction = Game.GetFormFromFile(0x000B91CF, "Skyrim.esm") as Faction
Faction WEDL06ThugFaction = Game.GetFormFromFile(0x000B91D4, "Skyrim.esm") as Faction

;QUEST
Quest pMS14 = Game.GetFormFromFile(0x00025F3E, "Skyrim.esm") as Quest

;patrol factions
DLC1VampirePatrolFaction.SetEnemy(VampireFaction, true, true)
DLC1VampirePatrolFaction.SetEnemy(WEDL03Faction)
DLC1VampirePatrolFaction.SetEnemy(WEDL05Faction)
DLC1VampirePatrolFaction.SetEnemy(WEDL06LutreshFaction)
DLC1VampirePatrolFaction.SetEnemy(WEDL06ThugFaction)
DLC1DawnguardPatrolFaction.SetEnemy(VampireFaction)
DLC1DawnguardPatrolFaction.SetEnemy(WEDL03Faction)
DLC1DawnguardPatrolFaction.SetEnemy(WEDL05Faction)
DLC1DawnguardPatrolFaction.SetEnemy(WEDL06LutreshFaction)
DLC1DawnguardPatrolFaction.SetEnemy(WEDL06ThugFaction)

;NPC Factions
DLC1HunterFactionNPC.SetEnemy(WEDL03Faction)
DLC1HunterFactionNPC.SetEnemy(WEDL05Faction)
DLC1VampireFactionNPC.SetEnemy(WEDL03Faction)
DLC1VampireFactionNPC.SetEnemy(WEDL05Faction)

if Game.IsPluginInstalled("FDE Alva.esp") && Alva.IsDead() && pMS14.IsCompleted()
Alva.Reset()
Alva.Resurrect()
Alva.SetAV( "aggression", 1 )
Alva.SetAV( "confidence", 4 )
Alva.SetAV( "assistance", 2 )
endif

if Game.IsPluginInstalled("FDE Alva.esp") && pMS14.IsCompleted() && !Alva.IsDead()
Alva.SetAV( "aggression", 1 )
Alva.SetAV( "confidence", 4 )
Alva.SetAV( "assistance", 2 )
CompleteQuest()
STop()
else
CompleteQuest()
STop()
endif
;END UPDATE

;END CODE
EndFunction

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction Property DLC1HunterFactionNPC  Auto
Faction Property DLC1VampireFactionNPC  Auto
Faction Property DLC1DawnguardPatrolFaction  Auto
Faction Property DLC1VampirePatrolFaction  Auto