;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 35
Scriptname QF_RelationshipMarriageCourti_00074793 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TempleofMara
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TempleofMara Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TemplePriest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TemplePriest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoveInterest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoveInterest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TempleCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TempleCenter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Player is asked to arrange the wedding
SetObjectiveDisplayed(10, abforce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;Player has talked to the priest about wedding ceremonies
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;Player kills love interest or breaks up with love interest
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;player has heard that the Temple of Mara does wedding ceremonies
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;Player buys a Symbol of Mara
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE RelationshipMarriageQuestScript
Quest __temp = self as Quest
RelationshipMarriageQuestScript kmyQuest = __temp as RelationshipMarriageQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20,  abforce = true)


;Wedding day is set
WeddingQuestKeyword .SendStoryEvent(akref1 = Alias_LoveInterest.GetActorReference())
kmyquest.WeddingSet = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;Player is married
if Alias_LoveInterest.GetActorReference().IsInFaction(CFHAAF) == 1 && Alias_LoveInterest.GetActorReference().IsInFaction(DLC1VCF) == 0 && Alias_LoveInterest.GetActorReference().HasKeyword(Vampire) == 1 && DLC1PVL.GetValue() == 1
   Alias_LoveInterest.GetActorReference().RemoveFromFaction(CFHAAF)
endif

if Alias_LoveInterest.GetActorReference().IsInFaction(CFRE) == 1 && Alias_LoveInterest.GetActorReference().IsInFaction(DLC1VCF) == 0 && Alias_LoveInterest.GetActorReference().HasKeyword(Vampire) == 1 && DLC1PVL.GetValue() == 1
   Alias_LoveInterest.GetActorReference().RemoveFromFaction(CFRE)
endif

if Alias_LoveInterest.GetActorReference().IsInFaction(CFHJ) == 1 && Alias_LoveInterest.GetActorReference().IsInFaction(DLC1VCF) == 0 && Alias_LoveInterest.GetActorReference().HasKeyword(Vampire) == 1 && DLC1PVL.GetValue() == 1
   Alias_LoveInterest.GetActorReference().RemoveFromFaction(CFHJ)
endif

if Alias_LoveInterest.GetActorReference().IsInFaction(CFWH) == 1 && Alias_LoveInterest.GetActorReference().IsInFaction(DLC1VCF) == 0 && Alias_LoveInterest.GetActorReference().HasKeyword(Vampire) == 1 && DLC1PVL.GetValue() == 1
   Alias_LoveInterest.GetActorReference().RemoveFromFaction(CFWH)
endif

if Alias_LoveInterest.GetActorReference().IsInFaction(CFF) == 1 && Alias_LoveInterest.GetActorReference().IsInFaction(DLC1VCF) == 0 && Alias_LoveInterest.GetActorReference().HasKeyword(Vampire) == 1 && DLC1PVL.GetValue() == 1
   Alias_LoveInterest.GetActorReference().RemoveFromFaction(CFF)
endif

if Alias_LoveInterest.GetActorReference().IsInFaction(CFP) == 1 && Alias_LoveInterest.GetActorReference().IsInFaction(DLC1VCF) == 0 && Alias_LoveInterest.GetActorReference().HasKeyword(Vampire) == 1 && DLC1PVL.GetValue() == 1
   Alias_LoveInterest.GetActorReference().RemoveFromFaction(CFP)
endif

if Alias_LoveInterest.GetActorReference().IsInFaction(CFWI) == 1 && Alias_LoveInterest.GetActorReference().IsInFaction(DLC1VCF) == 0 && Alias_LoveInterest.GetActorReference().HasKeyword(Vampire) == 1 && DLC1PVL.GetValue() == 1
   Alias_LoveInterest.GetActorReference().RemoveFromFaction(CFWI)
endif

if Alias_LoveInterest.GetActorReference().IsInFaction(CFEA) == 1 && Alias_LoveInterest.GetActorReference().IsInFaction(DLC1VCF) == 0 && Alias_LoveInterest.GetActorReference().HasKeyword(Vampire) == 1 && DLC1PVL.GetValue() == 1
   Alias_LoveInterest.GetActorReference().RemoveFromFaction(CFEA)
endif

if Alias_LoveInterest.GetActorReference().IsInFaction(CFR) == 1 && Alias_LoveInterest.GetActorReference().IsInFaction(DLC1VCF) == 0 && Alias_LoveInterest.GetActorReference().HasKeyword(Vampire) == 1 && DLC1PVL.GetValue() == 1
   Alias_LoveInterest.GetActorReference().RemoveFromFaction(CFR)
endif
If DLC1PVL.GetValue() == 1 && Alias_LoveInterest.GetActorReference().HasKeyword(Vampire) == 1
   Alias_LoveInterest.GetActorReference().AddPerk(VampireReduceDamage)
   Alias_LoveInterest.GetActorReference().AddPerk(VampireIncreaseDamage)
   Alias_LoveInterest.GetActorReference().AddToFaction(DLC1VF)
   Alias_LoveInterest.GetActorReference().AddToFaction(DLC1VCF)
   Alias_LoveInterest.GetActorReference().SetOutfit(VampireOutfit)
   Alias_LoveInterest.GetActorReference().SetCrimeFaction(DLC1VCF)
endif
SetObjectiveCompleted(20, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RelationshipMarriage  Auto  

Quest Property RelationshipMarriageBreakUp  Auto  

Keyword Property RelationshipMarriageKeyword  Auto  

Quest Property RelationshipMarriageWedding  Auto  

Armor Property ReligiousSymbolMaraLove  Auto  

Keyword Property WeddingQuestKeyword  Auto  

Faction Property MarriageCourtingFaction  Auto  

Outfit Property VampireOutfit  Auto  
Faction Property DLC1VF  Auto  
Faction Property DLC1VCF  Auto  
Faction Property DLC1VampireFeedNoCrimeFaction  Auto  
Faction Property CFHAAF Auto					
Faction Property CFRE Auto					
Faction Property CFHJ Auto					
Faction Property CFWH Auto					
Faction Property CFF Auto					
Faction Property CFP Auto					
Faction Property CFWI Auto					
Faction Property CFEA Auto					
Faction Property CFR Auto
Keyword Property Vampire Auto
Quest Property DLC1VQ03V  Auto  
GlobalVariable Property DLC1PVL  Auto  
Perk Property VampireReduceDamage  Auto  
Perk Property VampireIncreaseDamage  Auto  
