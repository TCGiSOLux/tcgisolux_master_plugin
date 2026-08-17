;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TCGiSOLuxMPIUpdate21 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update Factions
Factions()
;END CODE
EndFunction

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Start update Alva
AlvaHostilityFix()
;END CODE
EndFunction

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Start update Hroggar
HroggarFix()
;END CODE
EndFunction

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction Property HircineFightersFaction  Auto
Faction Property DLC1VampireAgentsFaction  Auto
Faction Property DLC1HunterAgentsFaction  Auto  

Function Factions()
Faction VampireFaction = Game.GetFormFromFile(0x00027242, "Skyrim.esm") as Faction
Faction HunterFaction = Game.GetFormFromFile(0x0004E509, "Skyrim.esm") as Faction
Faction DLC1HunterFaction = Game.GetFormFromFile(0x00003375, "Dawnguard.esm") as Faction
Faction DLC1VampireFaction = Game.GetFormFromFile(0x00003376, "Dawnguard.esm") as Faction
Faction DLC2HunterFaction = Game.GetFormFromFile(0x0003A4CA, "Dragonborn.esm") as Faction

HircineFightersFaction.SetEnemy(VampireFaction, false, false)
HircineFightersFaction.SetEnemy(DLC1VampireFaction, false, false)
HircineFightersFaction.SetEnemy(DLC1VampireAgentsFaction, false, false)
HircineFightersFaction.SetEnemy(HunterFaction, true, true)
HircineFightersFaction.SetEnemy(DLC1HunterFaction, true, true)
HircineFightersFaction.SetEnemy(DLC1HunterAgentsFaction, true, true)
HircineFightersFaction.SetEnemy(DLC2HunterFaction, true, true)
SetStage(100)
EndFunction

Function AlvaHostilityFix()
Quest MS14Quest = Game.GetFormFromFile(0x00025F3E, "Skyrim.esm") as Quest
Faction VampireFaction = Game.GetFormFromFile(0x00027242, "Skyrim.esm") as Faction
Faction TownMorthalFaction = Game.GetFormFromFile(0x0002817D, "Skyrim.esm") as Faction
Actor Alva = Game.GetFormFromFile(0x0001AA5C, "Skyrim.esm") as Actor
Actor Lami = Game.GetFormFromFile(0x0001AA61, "Skyrim.esm") as Actor
Actor Hroggar = Game.GetFormFromFile(0x0001AA5D, "Skyrim.esm") as Actor
Faction CrimeFaction = Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction

if MS14Quest.GetStageDone(95) == 1 || MS14Quest.GetStageDone(100) == 1
Alva.RemoveFromFaction(TownMorthalFaction)
Alva.RemoveFromFaction(CrimeFaction)
Alva.AddToFaction(VampireFaction)
Alva.SetCrimeFaction(None)
Alva.SetAV( "aggression", 2 )
Alva.SetRelationshipRank(Lami, 0)
Alva.SetRelationshipRank(Hroggar, 0)
endif

SetStage(200)
EndFunction

Function HroggarFix()
Quest MS14Quest = Game.GetFormFromFile(0x00025F3E, "Skyrim.esm") as Quest
Faction CrimeFaction = Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction
Faction VampireFaction = Game.GetFormFromFile(0x00027242, "Skyrim.esm") as Faction
Faction TownMorthalFaction = Game.GetFormFromFile(0x0002817D, "Skyrim.esm") as Faction
Actor Alva = Game.GetFormFromFile(0x0001AA5C, "Skyrim.esm") as Actor
Actor Lami = Game.GetFormFromFile(0x0001AA61, "Skyrim.esm") as Actor
Actor Hroggar = Game.GetFormFromFile(0x0001AA5D, "Skyrim.esm") as Actor
Actor BossVampireMorvath = Game.GetFormFromFile(0x0001F593, "Skyrim.esm") as Actor

if MS14Quest.GetStageDone(200) == 1
Alva.SetRelationshipRank(Lami, 0)
Alva.SetRelationshipRank(Hroggar, 0)
Alva.RemoveFromFaction(TownMorthalFaction)
Alva.RemoveFromFaction(CrimeFaction)
Alva.AddToFaction(VampireFaction)
Alva.SetCrimeFaction(None)
Alva.SetAV( "aggression", 2 )
BossVampireMorvath.Disable()
Hroggar.SetCrimeFaction(CrimeFaction)
Hroggar.StopCombatAlarm()
endif

EndFunction
