;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC1_QF_DLC1RV07_0100A29C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Coffin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Coffin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Habitation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Habitation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dwelling
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dwelling Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Candidate
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Candidate Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MainDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MainDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
FailAllObjectives()
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
CompleteAllObjectives()
if Alias_Candidate.GetActorReference().IsInFaction(CrimeFactionHaafingar) == 1
   Alias_Candidate.GetActorReference().RemoveFromFaction(CrimeFactionHaafingar)
endif

if Alias_Candidate.GetActorReference().IsInFaction(CrimeFactionReach) == 1
   Alias_Candidate.GetActorReference().RemoveFromFaction(CrimeFactionReach)
endif

if Alias_Candidate.GetActorReference().IsInFaction(CrimeFactionHjaalmarch) == 1
   Alias_Candidate.GetActorReference().RemoveFromFaction(CrimeFactionHjaalmarch)
endif

if Alias_Candidate.GetActorReference().IsInFaction(CrimeFactionWhiterun) == 1
   Alias_Candidate.GetActorReference().RemoveFromFaction(CrimeFactionWhiterun)
endif

if Alias_Candidate.GetActorReference().IsInFaction(CrimeFactionFalkreath) == 1
   Alias_Candidate.GetActorReference().RemoveFromFaction(CrimeFactionFalkreath)
endif

if Alias_Candidate.GetActorReference().IsInFaction(CrimeFactionPale) == 1
   Alias_Candidate.GetActorReference().RemoveFromFaction(CrimeFactionPale)
endif

if Alias_Candidate.GetActorReference().IsInFaction(CrimeFactionWinterhold) == 1
   Alias_Candidate.GetActorReference().RemoveFromFaction(CrimeFactionWinterhold)
endif

if Alias_Candidate.GetActorReference().IsInFaction(CrimeFactionEastmarch) == 1
   Alias_Candidate.GetActorReference().RemoveFromFaction(CrimeFactionEastmarch)
endif

if Alias_Candidate.GetActorReference().IsInFaction(CrimeFactionRift) == 1
   Alias_Candidate.GetActorReference().RemoveFromFaction(CrimeFactionRift)
endif

Alias_Candidate.GetActorReference().RemoveFromFaction(DLC1VampireFeedNoCrimeFaction)
Alias_Candidate.GetActorReference().RemoveFromFaction(DLC1VampireSeductionBoostFaction)
Alias_Candidate.GetActorReference().AddToFaction(DLC1VampireCrimeFaction)
Alias_Candidate.GetActorReference().SetOutfit(VampireOutfit)
Alias_Candidate.GetActorReference().SetCrimeFaction(DLC1VampireCrimeFaction)
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 50)
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)
Alias_MapMarker.GetReference().AddToMap()
SetObjectiveDisplayed(10)
Game.GetPlayer().AddPerk(DLC1VampireSeductionBoost)
Alias_Candidate.GetActorReference().AddToFaction(DLC1VampireSeductionBoostFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player bit NPC
SetObjectiveCompleted(10)
Alias_Candidate.GetActorReference().AddToFaction(DLC1VampireFaction)
SetObjectiveDisplayed(100)

ObjectReference MainDoor = Alias_MainDoor.GetReference()
if MainDoor 
   Game.GetPlayer().AddKeyIfNeeded(MainDoor)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;set by DLC1VampireTurnScript
;change is completed while player is not present
Alias_Coffin.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DLC1RadiantScript Property DLC1Radiant  Auto  
Perk Property DLC1VampireSeductionBoost Auto  
Faction Property DLC1VampireSeductionBoostFaction  Auto  
Outfit Property VampireOutfit  Auto  
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