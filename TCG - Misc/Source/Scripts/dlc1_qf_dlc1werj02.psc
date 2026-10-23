;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC1_QF_DLC1WERJ02 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Julisande
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Julisande Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hert
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hert Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dawnguard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dawnguard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY mySpecificHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_mySpecificHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ulenrane
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ulenrane Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
alias_Hert.TryToMoveTo(alias_TravelMarker1.GetReference())
alias_Ulenrane.TryToMoveTo(alias_TravelMarker1.GetReference())
alias_Julisande.TryToMoveTo(alias_TravelMarker1.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()

alias_Hert.GetReference().MoveToMyEditorLocation()
alias_Ulenrane.GetReference().MoveToMyEditorLocation()
alias_Julisande.GetReference().MoveToMyEditorLocation()

; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Dawnguard.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 0")

setStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
alias_Hert.TryToEvaluatePackage()
alias_Ulenrane.TryToEvaluatePackage()
alias_Julisande.TryToEvaluatePackage()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

location Property HaafingerHold  Auto  
Location Property HjaalmarchHold  Auto  
Location Property ReachHold  Auto  
Location Property WhiterunHold  Auto  
Location Property FalkreathHold  Auto  
Location Property ThePaleHold  Auto  
Location Property WinterholdHold  Auto  
Location Property EastmarchHold  Auto  
Location Property RiftHold  Auto  
