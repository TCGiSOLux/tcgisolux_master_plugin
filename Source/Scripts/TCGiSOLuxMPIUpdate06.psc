;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate06 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC6 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update
if Alias_NPC2.GetActorReference().GetItemCount(MerryfarmKey) == 0 && Alias_NPC3.GetActorReference().GetItemCount(MerryfarmKey) == 0
  Alias_NPC2.GetActorReference().AddItem(MerryfarmKey,1)
  Alias_NPC3.GetActorReference().AddItem(MerryfarmKey,1)
endif
if Alias_NPC4.GetActorReference().GetItemCount(SarethiFarmKey) == 0 && Alias_NPC5.GetActorReference().GetItemCount(SarethiFarmKey) == 0
  Alias_NPC4.GetActorReference().AddItem(SarethiFarmKey,1)
  Alias_NPC5.GetActorReference().AddItem(SarethiFarmKey,1)
endif
Alias_NPC6.GetActorReference().AddToFaction(DLC1VolkiharClanFaction)
If SolitudeOpening.GetStageDone(30) == 0 && SolitudeOpening.GetStageDone(200) == 1
  Alias_NPC1.GetActorReference().RemoveFromFaction(CrimeFactionHaafingar)
  Alias_NPC1.GetActorReference().SetCrimeFaction(None)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionHaafingar)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionReach)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionHjaalmarch)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionWhiterun)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionFalkreath)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionPale)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionWinterhold)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionRift)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionEastmarch)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireCrimeFaction)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireFaction)
Endif

If SolitudeOpening.GetStageDone(200) == 1 && SolitudeOpening.GetStageDone(30) == 1
  Alias_NPC1.GetActorReference().RemoveFromFaction(CrimeFactionHaafingar)
  Alias_NPC1.GetActorReference().SetCrimeFaction(None)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionHaafingar)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionReach)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionHjaalmarch)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionWhiterun)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionFalkreath)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionPale)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionWinterhold)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionRift)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionEastmarch)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireCrimeFaction)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireFaction)
Endif
;Update completed
Stop()
;END CODE
EndFunction
;END FRAGMENT
Quest Property SolitudeOpening  Auto  
Faction Property SolitudeOpeningPrisonerFaction  Auto  
Faction Property CrimeFactionHaafingar Auto
Faction Property CrimeFactionReach Auto
Faction Property CrimeFactionHjaalmarch Auto
Faction Property CrimeFactionWhiterun Auto
Faction Property CrimeFactionFalkreath Auto
Faction Property CrimeFactionPale Auto
Faction Property CrimeFactionWinterhold Auto
Faction Property CrimeFactionEastmarch Auto
Faction Property CrimeFactionRift Auto
Faction Property DLC1VampireCrimeFaction Auto
Faction Property DLC1VampireFaction  Auto  
Key Property SarethiFarmKey  Auto  
Key Property MerryfarmKey  Auto  
Faction Property DLC1VolkiharClanFaction  Auto  