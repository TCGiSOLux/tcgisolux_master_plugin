;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate07 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NPC8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC9 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if Alias_NPC7.GetActorReference().GetItemCount(RiftenMistveilKeepJarlQuartersKEY) == 0
  Alias_NPC7.GetActorReference().AddItem(RiftenMistveilKeepJarlQuartersKEY,1)
endif
if Alias_NPC8.GetActorReference().GetItemCount(RiftenMistveilKeepJarlQuartersKEY) == 0
  Alias_NPC8.GetActorReference().AddItem(RiftenMistveilKeepJarlQuartersKEY,1)
endif
if Alias_NPC9.GetActorReference().GetItemCount(RiftenMistveilKeepJarlQuartersKEY) == 0
  Alias_NPC9.GetActorReference().AddItem(RiftenMistveilKeepJarlQuartersKEY,1)
endif
if Alias_NPC10.GetActorReference().GetItemCount(RiftenMistveilKeepJarlQuartersKEY) == 0
  Alias_NPC10.GetActorReference().AddItem(RiftenMistveilKeepJarlQuartersKEY,1)
endif
if MS14Quest.GetStageDone(95) == 1 && MS14Quest.GetStageDone(100) == 0 && MS14Quest.GetStageDone(200) == 0
Alias_NPC1.GetActorReference().SetRelationshipRank(Alias_NPC2.GetActorReference(), 0)
Alias_NPC1.GetActorReference().SetRelationshipRank(Alias_NPC3.GetActorReference(), 0)
Alias_NPC1.GetActorReference().RemoveFromFaction(TownMorthalFaction)
Alias_NPC1.GetActorReference().RemoveFromFaction(CrimeFactionHjaalmarch)
Alias_NPC1.GetActorReference().AddToFaction(VampireFaction)
Alias_NPC1.GetActorReference().SetCrimeFaction(None)
Alias_NPC1.GetActorReference().setAV("Aggression", 2)
Alias_NPC2.GetActorReference().setAV("Aggression", 1)
Alias_NPC2.GetActorReference().setAV("Morality", 3)
Alias_NPC2.GetActorRef().SetFactionRank(CrimeFactionHjaalmarch, 0)
Endif

if !( Alias_NPC1.GetActorReference().IsDead() ) && MS14Quest.ISRunning() == 1
  if !( Alias_NPC1.GetActorReference().Is3DLoaded() ) && MS14Quest.ISRunning() == 1
    Alias_NPC1.GetActorReference().MoveTo(Alias_NPC4.GetReference())
  endif
endif

if MS14Quest.GetStageDone(100) == 1 && MS14Quest.GetStageDone(200) == 0
Alias_NPC1.GetActorReference().SetRelationshipRank(Alias_NPC2.GetActorReference(), 0)
Alias_NPC1.GetActorReference().SetRelationshipRank(Alias_NPC3.GetActorReference(), 0)
Alias_NPC1.GetActorReference().RemoveFromFaction(TownMorthalFaction)
Alias_NPC1.GetActorReference().RemoveFromFaction(CrimeFactionHjaalmarch)
Alias_NPC1.GetActorReference().AddToFaction(VampireFaction)
Alias_NPC1.GetActorReference().SetCrimeFaction(None)
Alias_NPC1.GetActorReference().setAV("Aggression", 2)
Alias_NPC2.GetActorReference().setAV("Aggression", 1)
Alias_NPC2.GetActorReference().setAV("Morality", 3)
endif

if !(Alias_NPC1.GetActorReference().IsDead())
  Alias_NPC1.GetActorReference().MoveTo(Alias_NPC4.GetReference())
endif

if MS14Quest.GetStageDone(200) == 1
Alias_NPC4.TryToDisable()
Alias_NPC1.GetActorReference().RemoveFromFaction(CrimeFactionHjaalmarch)
Alias_NPC1.GetActorReference().SetCrimeFaction(None)
Alias_NPC1.GetActorReference().setAV("Aggression", 2)
Alias_NPC1.GetActorReference().AddToFaction(VampireFaction)
Alias_NPC2.GetActorRef().SetFactionRank(CrimeFactionHjaalmarch, 0)
Alias_NPC2.GetActorReference().SetCrimeFaction(CrimeFactionHjaalmarch)
Alias_NPC2.GetActorReference().setAV("Aggression", 1)
Alias_NPC2.GetActorReference().setAV("Morality", 3)
endif

if Alias_NPC5.GetActorReference().IsInFaction(JobJarlFaction) == 1 && MS14Quest.GetStageDone(200) == 1 && Favor255.GetStageDone(200) == 0
     Alias_NPC5.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 2)
EndIf

if Alias_NPC6.GetActorReference().IsInFaction(JobJarlFaction) == 1 && MS14Quest.GetStageDone(200) == 1 && Favor255.GetStageDone(200) == 0
     Alias_NPC6.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 2)
EndIf

;Update completed
CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property MS14Quest  Auto 
Quest Property Favor255  Auto 
Faction Property CrimeFactionHjaalmarch Auto
Faction Property JobJarlFaction Auto
Faction Property VampireFaction Auto
Faction Property TownMorthalFaction  Auto  
Key Property RiftenMistveilKeepJarlQuartersKEY  Auto  
