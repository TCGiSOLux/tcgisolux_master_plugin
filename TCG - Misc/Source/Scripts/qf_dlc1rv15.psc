;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_DLC1RV15 Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Homeowner02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Homeowner04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Homeowner01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DawnguardHouse
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DawnguardHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Homeowner05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Homeowner07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DawnguardVictim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DawnguardVictim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Homeowner03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Homeowner06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DawnguardMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DawnguardMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimHometown
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_VictimHometown Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dawnguard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dawnguard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DawnguardHouseMainDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DawnguardHouseMainDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Homeowner08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Homeowner09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Homeowner10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Homeowner10 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)
Alias_Dawnguard.TryToEnable()
Alias_DawnguardHouseMainDoor.GetReference().Lock(false, true)
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20, 1)

Alias_Dawnguard.GetReference().DeleteWhenAble()

CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 45)
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1RadiantScript Property DLC1Radiant  Auto  
