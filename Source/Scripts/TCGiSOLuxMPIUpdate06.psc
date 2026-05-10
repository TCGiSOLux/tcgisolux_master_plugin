;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate06 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC6 Auto
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

;BEGIN ALIAS PROPERTY NPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
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
  Alias_NPC1.GetActorReference().SetActorValue( "aggression", 1 )
  Alias_NPC1.GetActorReference().RemoveFromFaction(CrimeFactionHaafingar)
  Alias_NPC1.GetActorReference().SetCrimeFaction(None)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionHaafingar)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireCrimeFaction)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireFaction)
Endif

If SolitudeOpening.GetStageDone(200) == 1 && SolitudeOpening.GetStageDone(30) == 1
  Alias_NPC1.GetActorReference().SetActorValue( "aggression", 1 )
  Alias_NPC1.GetActorReference().RemoveFromFaction(CrimeFactionHaafingar)
  Alias_NPC1.GetActorReference().SetCrimeFaction(None)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionHaafingar)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireCrimeFaction)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireFaction)
Endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property SolitudeOpening  Auto  
Faction Property SolitudeOpeningPrisonerFaction  Auto  
Faction Property CrimeFactionHaafingar Auto
Faction Property DLC1VampireCrimeFaction Auto
Faction Property DLC1VampireFaction  Auto  
Key Property SarethiFarmKey  Auto  
Key Property MerryfarmKey  Auto  
Faction Property DLC1VolkiharClanFaction  Auto  
