;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_DLC1RV14 Extends Quest Hidden

;BEGIN ALIAS PROPERTY EndingLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EndingLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Criminal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Criminal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartingLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_StartingLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LocationHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationStart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationStart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationEnd
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationEnd Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_Criminal.GetReference().Delete()
CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 30)
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)
Alias_Criminal.TryToEnable()
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1RadiantScript Property DLC1Radiant  Auto  
