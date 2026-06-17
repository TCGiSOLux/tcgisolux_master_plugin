;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate17 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CamillaLeotelli
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CamillaLeotelli Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LailatheUnbroken
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LailatheUnbroken Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spouse Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE T01QuestScript
Quest __temp = self as Quest
T01QuestScript kmyQuest = __temp as T01QuestScript
;END AUTOCAST
;BEGIN CODE
;Start update

if DLC2CultistAmbush.GetStageDone(10) == 1 || DLC2WE09.GetStageDone(10) == 1
DLC2CultistFaction.SetEnemy(IsGuardFaction)
endif

if T01.GetStageDone(60) == 1 && T01.GetStageDone(200) == 0
;Fix spamming Hamal forcegreeting to Player
kmyQuest.HamalShouldConfront = False
endif

if T01.GetStageDone(200) == 1
Alias_LailatheUnbroken.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_CamillaLeotelli.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
endif

if DLC1IntroCompletedVampire.GetValue() == 1
  Game.GetPlayer().AddPerk(VampireReduceDamage)
  Game.GetPlayer().AddPerk(VampireIncreaseDamage)
Endif

if DLC1IntroCompletedHunter.GetValue() == 1
  Game.GetPlayer().AddPerk(DawnguardReduceDamage)
  Game.GetPlayer().AddPerk(DawnguardIncreaseDamage)
Endif

if Alias_Spouse.GetActorReference().IsInFaction(DLC1VampireCrimeFaction) == 1
Alias_Spouse.GetActorReference().AddPerk(VampireReduceDamage)
Alias_Spouse.GetActorReference().AddPerk(VampireIncreaseDamage)
Endif

CompleteQuest()
Stop()

;END CODE
EndFunction
;END FRAGMENT  

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property DLC2CultistAmbush  Auto  
Quest Property DLC2WE09  Auto  
Quest Property T01  Auto  
Faction Property IsGuardFaction  Auto  
Faction Property DLC1VampireCrimeFaction  Auto  
Faction Property DLC2CultistFaction  Auto  
Perk Property VampireReduceDamage  Auto  
Perk Property VampireIncreaseDamage  Auto  
Perk Property DawnguardReduceDamage  Auto  
Perk Property DawnguardIncreaseDamage  Auto  
GlobalVariable Property DLC1IntroCompletedVampire  Auto
GlobalVariable Property DLC1IntroCompletedHunter  Auto  