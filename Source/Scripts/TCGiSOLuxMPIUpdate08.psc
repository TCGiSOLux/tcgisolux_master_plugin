;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate08 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update

if DLC1VQ08QUEST.GetStageDone(60) == 1 && DLC1PlayingVampireLine.GetValue() == 0
  DialogueVampireBase.Stop()
  DialogueVampireCuredBlock.Stop()
Endif

If Game.GetPlayer().IsInFaction(VampirePCFaction) == 1
  Game.GetPlayer().RemoveFromFaction(VampirePCFaction)
  Game.GetPlayer().SetAttackActorOnSight(False)
Endif

If DLC1HarkonDead.GetValue() == 0 && DLC1PlayingVampireLine.GetValue() == 0
  DLC1VampireCastleGuildhall.SetFactionOwner(DLC1VampireFaction)
Endif
SolitudeErikursHouse.SetFactionOwner(SolitudeErikursHouseFaction)
HollyfrostFarm.SetFactionOwner(HollyFrostFarmFaction)
BrandyMugFarm.SetFactionOwner(BrandyMugFarmFaction)
HlaaluFarm.SetFactionOwner(HlaaluFarmFaction)
SolitudeVittoriaVicisHouse.SetFactionOwner(SolitudeVittoriaVicciHouseFaction)
DLC1DawnguardHQ01.SetFactionOwner(DLC1HunterFaction)

If DLC1RV10.GetStageDone(255) == 1
  DLC1DawnguardHQ01.SetFactionOwner(DLC1HunterFaction)
  DLC1DawnguardHQ01.SetPublic(false)
  DialogueHunterBase.Stop()
  DialogueHunterVampireBlock.Stop()
  DawnguardAgents.Stop()
  VampireAgents.Stop()
Endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction Property VampirePCFaction Auto
Cell Property SolitudeVittoriaVicisHouse Auto
Faction Property SolitudeVittoriaVicciHouseFaction Auto
Cell Property HlaaluFarm Auto
Faction Property HlaaluFarmFaction Auto
Cell Property SolitudeErikursHouse Auto
Faction Property SolitudeErikursHouseFaction Auto
Cell Property HollyfrostFarm Auto
Faction Property HollyFrostFarmFaction Auto
Cell Property BrandyMugFarm Auto
Faction Property BrandyMugFarmFaction Auto
Faction Property DLC1HunterFaction Auto
Faction Property DLC1VampireFaction Auto
Cell Property DLC1VampireCastleGuildhall Auto
Cell Property DLC1DawnguardHQ01 Auto
GlobalVariable Property DLC1PlayingVampireLine  Auto
GlobalVariable Property DLC1HarkonDead  Auto
Quest Property DLC1VQ08QUEST  Auto 
Quest Property DLC1RV10  Auto  
Quest Property DawnguardAgents  Auto
Quest Property DialogueHunterBase  Auto  
Quest Property DialogueHunterVampireBlock  Auto
Quest Property DialogueVampireBase Auto
Quest Property DialogueVampireCuredBlock Auto
  
Quest Property VampireAgents  Auto  
