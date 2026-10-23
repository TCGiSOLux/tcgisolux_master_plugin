;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname DLC1_QF_DLC1WERJ01 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AssumanuAshishpalirdan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AssumanuAshishpalirdan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImpeAssumanuAshishpalirdanl
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImpeAssumanuAshishpalirdanl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY mySpecificHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_mySpecificHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SarthisIdren
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SarthisIdren Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OriniDral
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OriniDral Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LalaineCatia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LalaineCatia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
alias_LalaineCatia.GetReference().MoveTo(alias_TravelMarker1.GetReference())
alias_AssumanuAshishpalirdan.GetReference().MoveTo(alias_TravelMarker1.GetReference())
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

alias_LalaineCatia.GetReference().MoveToMyEditorLocation()
alias_AssumanuAshishpalirdan.GetReference().MoveToMyEditorLocation()

Alias_SarthisIdren.GetReference().Delete()
Alias_OriniDral.GetReference().Delete()
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
if Alias_OriniDral.GetActorReference().IsDead() && Alias_SarthisIdren.GetActorReference().IsDead()
alias_LalaineCatia.GetActorReference().EvaluatePackage()
alias_AssumanuAshishpalirdan.GetActorReference().EvaluatePackage()
Stop()
endif

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property HaafingerHold  Auto  
Location Property HjaalmarchHold  Auto  
Location Property ReachHold  Auto  
Location Property WhiterunHold  Auto  
Location Property FalkreathHold  Auto  
Location Property ThePaleHold  Auto  
Location Property WinterholdHold  Auto  
Location Property EastmarchHold  Auto  
Location Property RiftHold  Auto  
