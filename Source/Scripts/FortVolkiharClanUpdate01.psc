;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname FortVolkiharClanUpdate01 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Spouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cairine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cairine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Valindor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Valindor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Haran
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Haran Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;START SETUP UPDATE PATCH V1.0

;FIX TRESPASSING TO MARISE ARAVEL HOUSE AFTER INSTALLING PLUGIN
RiftenMariseHouse.SetFactionOwner(AravelFamiliyFaction)
RiftenMariseHouse.SetPublic(true)
Utility.Wait(2)
RiftenMariseHouse.SetPublic(false)
Utility.Wait(2)
;In enemy Dawnguard base we will make all items will be marked as a stolen
If DLC1VQ03Vampire.GetStageDone(5) == 1 && DLC1RV10.GetStageDone(10) == 0
  DLC1DawnguardHQ01.SetFactionOwner(DLC1HunterFaction)
  DLC1DawnguardHQ01.SetPublic(false)
Endif
;IF SPOUSE ARE ALREADY VAMPIRE MAKE OUTFIT AND SET CRIME FACTION AND QUEST THE GIFT WILL BE SKIPPED
if Alias_Spouse.GetActorReference().IsInFaction(PlayerMarriedFaction) == 1 && DLC1VQ03Vampire.GetStageDone(5) == 1 && DLC1RV06DoOnce.GetValue() == 0 && Alias_Spouse.GetActorReference().HasKeyword(Vampire) == 1
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().SetOutfit(VampireOutfit)
endif
;CHANGE SPOUSE TO VAMPIRE OUTFIT AND SET CRIME FACTION IF QUEST THE GIFT COMPLETED
if Alias_Spouse.GetActorReference().IsInFaction(CrimeFactionHaafingar) == 1 && DLC1RV06.GetStageDone(255) == 1 && DLC1RV06DoOnce.GetValue() == 1
   Alias_Spouse.GetActorReference().RemoveFromFaction(CrimeFactionHaafingar)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Spouse.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif
if Alias_Spouse.GetActorReference().IsInFaction(CrimeFactionReach) == 1 && DLC1RV06.GetStageDone(255) == 1 && DLC1RV06DoOnce.GetValue() == 1
   Alias_Spouse.GetActorReference().RemoveFromFaction(CrimeFactionReach)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Spouse.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif
if Alias_Spouse.GetActorReference().IsInFaction(CrimeFactionHjaalmarch) == 1 && DLC1RV06.GetStageDone(255) == 1 && DLC1RV06DoOnce.GetValue() == 1
   Alias_Spouse.GetActorReference().RemoveFromFaction(CrimeFactionHjaalmarch)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Spouse.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif
if Alias_Spouse.GetActorReference().IsInFaction(CrimeFactionWhiterun) == 1 && DLC1RV06.GetStageDone(255) == 1 && DLC1RV06DoOnce.GetValue() == 1
   Alias_Spouse.GetActorReference().RemoveFromFaction(CrimeFactionWhiterun)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Spouse.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif
if Alias_Spouse.GetActorReference().IsInFaction(CrimeFactionFalkreath) == 1 && DLC1RV06.GetStageDone(255) == 1 && DLC1RV06DoOnce.GetValue() == 1
   Alias_Spouse.GetActorReference().RemoveFromFaction(CrimeFactionFalkreath)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Spouse.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif
if Alias_Spouse.GetActorReference().IsInFaction(CrimeFactionPale) == 1 && DLC1RV06.GetStageDone(255) == 1 && DLC1RV06DoOnce.GetValue() == 1
   Alias_Spouse.GetActorReference().RemoveFromFaction(CrimeFactionPale)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Spouse.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Spouse.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
endif
if Alias_Spouse.GetActorReference().IsInFaction(CrimeFactionWinterhold) == 1 && DLC1RV06.GetStageDone(255) == 1 && DLC1RV06DoOnce.GetValue() == 1
   Alias_Spouse.GetActorReference().RemoveFromFaction(CrimeFactionWinterhold)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Spouse.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif
if Alias_Spouse.GetActorReference().IsInFaction(CrimeFactionEastmarch) == 1 && DLC1RV06.GetStageDone(255) == 1 && DLC1RV06DoOnce.GetValue() == 1
   Alias_Spouse.GetActorReference().RemoveFromFaction(CrimeFactionEastmarch)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Spouse.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif
if Alias_Spouse.GetActorReference().IsInFaction(CrimeFactionRift) == 1 && DLC1RV06.GetStageDone(255) == 1 && DLC1RV06DoOnce.GetValue() == 1
   Alias_Spouse.GetActorReference().RemoveFromFaction(CrimeFactionRift)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Spouse.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Spouse.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Spouse.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif

;CHECK IF CAIRINE VAMPIRE
if Alias_Cairine.GetActorReference().IsInFaction(CrimeFactionReach) == 1 && Alias_Cairine.GetActorReference().HasKeyword(Vampire) == 1
   Alias_Cairine.GetActorReference().RemoveFromFaction(CrimeFactionReach)
   Alias_Cairine.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Cairine.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Cairine.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Cairine.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Cairine.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Cairine.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif

;CHECK IF HARAN VAMPIRE
if Alias_Haran.GetActorReference().IsInFaction(CrimeFactionWinterhold) == 1 && Alias_Haran.GetActorReference().HasKeyword(Vampire) == 1
   Alias_Haran.GetActorReference().RemoveFromFaction(CrimeFactionWinterhold)
   Alias_Haran.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Haran.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Haran.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Haran.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Haran.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Haran.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif

;CHECK IF VALINDOR VAMPIRE
if Alias_Valindor.GetActorReference().IsInFaction(CrimeFactionRift) == 1 && Alias_Valindor.GetActorReference().HasKeyword(Vampire) == 1
   Alias_Valindor.GetActorReference().RemoveFromFaction(CrimeFactionRift)
   Alias_Valindor.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
   Alias_Valindor.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
   Alias_Valindor.GetActorReference().AddToFaction(DLC1VampireFaction)
   Alias_Valindor.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
   Alias_Valindor.GetActorReference().SetOutfit(VampireOutfit)
   Alias_Valindor.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
endif

;FIX TRESPASSING TO FORT DAWNGUARD DURING QUEST DESTROYING THE DAWNGUARD
If DLC1RV10.GetStageDone(10) == 1 && DLC1RV10.GetStageDone(100) == 0 && DLC1RV10DoOnce.GetValue() == 1
  DLC1DawnguardHQ01.SetPublic(true)
Endif

;DAWNGUARD LEADERS DEAD, MAKE UNPUBLIC FORT DAWNGUARD
If DLC1RV10.GetStageDone(100) == 1 && DLC1RV10.GetStageDone(255) == 1
  DLC1DawnguardHQ01.SetPublic(false)
Endif

;UPDATE COMPLETED, MAKE STOP THIS QUEST
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Cell Property RiftenMariseHouse Auto
Cell Property DLC1DawnguardHQ01 Auto
Quest Property DLC1VQ03Vampire  Auto  
Quest Property DLC1RV06  Auto  
Quest Property DLC1RV10  Auto  
Outfit Property VampireOutfit  Auto  
Faction Property DLC1VampireSeductionBoostFaction  Auto  
Faction Property AravelFamiliyFaction  Auto  
Faction Property DLC1VampireFaction  Auto  
Faction Property DLC1VampireCrimeFaction  Auto  
Faction Property DLC1VampireFeedNoCrimeFaction  Auto  
Faction Property CrimeFactionHaafingar Auto
Faction Property CrimeFactionReach Auto
Faction Property CrimeFactionHjaalmarch Auto
Faction Property CrimeFactionWhiterun Auto
Faction Property CrimeFactionFalkreath Auto
Faction Property CrimeFactionPale Auto
Faction Property CrimeFactionWinterhold Auto
Faction Property CrimeFactionEastmarch Auto
Faction Property CrimeFactionRift Auto
Faction Property DLC1HunterFaction Auto
Faction Property PlayerMarriedFaction Auto
GlobalVariable property DLC1RV06DoOnce AUTO
GlobalVariable property DLC1RV10DoOnce AUTO
Keyword Property Vampire Auto