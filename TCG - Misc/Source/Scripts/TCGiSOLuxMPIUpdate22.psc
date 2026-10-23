;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 23
Scriptname TCGiSOLuxMPIUpdate22 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE

;Actor
Actor GabriellaREF = Game.GetFormFromFile(0x0001BDEB, "Skyrim.esm") as Actor

;Factions
Faction DarkBrotherhoodFaction = Game.GetFormFromFile(0x0001BDB3, "Skyrim.esm") as Faction
Faction ForswornFaction = Game.GetFormFromFile(0x00043599, "Skyrim.esm") as Faction
Faction BanditFaction = Game.GetFormFromFile(0x0001BCC0, "Skyrim.esm") as Faction
Faction PredatorFaction = Game.GetFormFromFile(0x0002E893, "Skyrim.esm") as Faction
Faction DragonFaction = Game.GetFormFromFile(0x00032D9C, "Skyrim.esm") as Faction
Faction WerewolfFaction = Game.GetFormFromFile(0x00043594, "Skyrim.esm") as Faction
Faction DA13AfflictedFaction = Game.GetFormFromFile(0x00043AB7, "Skyrim.esm") as Faction
Faction WIThugFaction = Game.GetFormFromFile(0x0004EEFC, "Skyrim.esm") as Faction
Faction VigilantOfStendarrFaction = Game.GetFormFromFile(0x000B3292, "Skyrim.esm") as Faction
Faction DLC1PlayerVampireLordFaction = Game.GetFormFromFile(0x000071D3, "Dawnguard.esm") as Faction
Faction DLC1DawnguardExteriorGuardFaction = Game.GetFormFromFile(0x00010EC1, "Dawnguard.esm") as Faction
Faction DLC1_WESC09Faction = Game.GetFormFromFile(0x00014BFA, "Dawnguard.esm") as Faction
Faction DLC2CultistFaction = Game.GetFormFromFile(0x00034FBC, "Dragonborn.esm") as Faction

Faction VampireFaction = Game.GetFormFromFile(0x00027242, "Skyrim.esm") as Faction
Faction HunterFaction = Game.GetFormFromFile(0x0004E509, "Skyrim.esm") as Faction
Faction CompanionsFaction = Game.GetFormFromFile(0x00048362, "Skyrim.esm") as Faction
Faction DLC1HunterFaction = Game.GetFormFromFile(0x00003375, "Dawnguard.esm") as Faction
Faction DLC1VampireFaction = Game.GetFormFromFile(0x00003376, "Dawnguard.esm") as Faction
Faction DLC2HunterFaction = Game.GetFormFromFile(0x0003A4CA, "Dragonborn.esm") as Faction

DLC1VampireFaction.SetEnemy(VigilantOfStendarrFaction, false, false)

;molag bals vampires
MolagBalsVampiresFaction.SetAlly(VampireFaction, true, true)
MolagBalsVampiresFaction.SetAlly(DLC1VampireFaction, true, true)
MolagBalsVampiresFaction.SetAlly(DLC2VampireFaction, true, true)
MolagBalsVampiresFaction.SetAlly(DLC1VampireAgentsFaction, true, true)
MolagBalsVampiresFaction.SetEnemy(CompanionsFaction, false, false)
MolagBalsVampiresFaction.SetEnemy(HunterFaction, false, false)
MolagBalsVampiresFaction.SetEnemy(DLC1HunterFaction, false, false)
MolagBalsVampiresFaction.SetEnemy(DLC1HunterAgentsFaction, false, false)
MolagBalsVampiresFaction.SetEnemy(DLC2HunterFaction, false, false)

;patrol factions
DLC1VampirePatrolFaction.SetEnemy(BanditFaction, false, false)
DLC1VampirePatrolFaction.SetEnemy(PredatorFaction, false, false)
DLC1VampirePatrolFaction.SetEnemy(DragonFaction, false, false)
DLC1VampirePatrolFaction.SetEnemy(WerewolfFaction, false, false)
DLC1VampirePatrolFaction.SetEnemy(DA13AfflictedFaction, false, false)
DLC1VampirePatrolFaction.SetEnemy(WIThugFaction, false, false)
DLC1VampirePatrolFaction.SetEnemy(DLC1_WESC09Faction, false, false)
DLC1VampirePatrolFaction.SetEnemy(DLC2CultistFaction, false, false)
DLC1VampirePatrolFaction.SetEnemy(VigilantOfStendarrFaction, false, false)
DLC1VampirePatrolFaction.SetEnemy(DLC1HunterFaction, false, false)
DLC1VampirePatrolFaction.SetEnemy(DLC1HunterAgentsFaction, false, false)
DLC1VampirePatrolFaction.SetAlly(DLC1VampireFaction)
DLC1VampirePatrolFaction.SetAlly(DLC1VampireAgentsFaction)
DLC1VampirePatrolFaction.SetAlly(DLC1PlayerVampireLordFaction)
DLC1VampirePatrolFaction.SetAlly(DLC1VolkiharExteriorGuardFaction)
DLC1DawnguardPatrolFaction.SetEnemy(BanditFaction, false, false)
DLC1DawnguardPatrolFaction.SetEnemy(PredatorFaction, false, false)
DLC1DawnguardPatrolFaction.SetEnemy(DragonFaction, false, false)
DLC1DawnguardPatrolFaction.SetEnemy(WerewolfFaction, false, false)
DLC1DawnguardPatrolFaction.SetEnemy(DA13AfflictedFaction, false, false)
DLC1DawnguardPatrolFaction.SetEnemy(WIThugFaction, false, false)
DLC1DawnguardPatrolFaction.SetEnemy(DLC1_WESC09Faction, false, false)
DLC1DawnguardPatrolFaction.SetEnemy(DLC2CultistFaction, false, false)
DLC1DawnguardPatrolFaction.SetEnemy(DLC1VampireFaction, false, false)
DLC1DawnguardPatrolFaction.SetEnemy(DLC1VampireAgentsFaction, false, false)
DLC1DawnguardPatrolFaction.SetEnemy(DLC1PlayerVampireLordFaction, false, false)
DLC1DawnguardPatrolFaction.SetAlly(DLC1HunterFaction)
DLC1DawnguardPatrolFaction.SetAlly(DLC1HunterAgentsFaction)
DLC1DawnguardPatrolFaction.SetAlly(VigilantOfStendarrFaction)

;radiant factions
DLC1RadiantVampireBanditNecroAllys.SetAlly(ForswornFaction)
DLC1RadiantHunterBanditNecroVampAllys.SetAlly(ForswornFaction)

;NPC Factions
DLC1HunterFactionNPC.SetEnemy(DLC1_WESC09Faction)
DLC1VampireFactionNPC.SetEnemy(DLC1_WESC09Faction)

;crime faction
GabriellaREF.SetCrimeFaction(DarkBrotherhoodFaction)
;END UPDATE

CompleteQuest()
STop()
;END CODE
EndFunction

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction Property DLC1HunterFactionNPC  Auto
Faction Property DLC1VampireFactionNPC  Auto
Faction Property MolagBalsVampiresFaction  Auto
Faction Property DLC1VampireAgentsFaction  Auto
Faction Property DLC2VampireFaction  Auto
Faction Property DLC1HunterAgentsFaction  Auto
Faction Property DLC1DawnguardPatrolFaction  Auto
Faction Property DLC1VampirePatrolFaction  Auto
Faction Property DLC1VolkiharExteriorGuardFaction  Auto
Faction Property DLC1RadiantHunterBanditNecroVampAllys  Auto
Faction Property DLC1RadiantVampireBanditNecroAllys  Auto