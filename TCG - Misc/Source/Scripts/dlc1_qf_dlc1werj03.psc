;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC1_QF_DLC1WERJ03 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Thalmor1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thalmor2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Namasur
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Namasur Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thalmor3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alusannah
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alusannah Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY mySpecificHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_mySpecificHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Modhna
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Modhna Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
alias_Alusannah.GetReference().MoveTo(alias_TravelMarker1.GetReference())
alias_Namasur.GetReference().MoveTo(alias_TravelMarker1.GetReference())
alias_Modhna.GetReference().MoveTo(alias_TravelMarker1.GetReference())

alias_Thalmor1.GetReference().Enable()
alias_Thalmor2.GetReference().Enable()
alias_Thalmor3.GetReference().Enable()

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

alias_Alusannah.GetReference().MoveToMyEditorLocation()
alias_Namasur.GetReference().MoveToMyEditorLocation()
alias_Modhna.GetReference().MoveToMyEditorLocation()

; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Thalmor1.GetReference().DeleteWhenAble()
Alias_Thalmor2.GetReference().DeleteWhenAble()
Alias_Thalmor3.GetReference().DeleteWhenAble()
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

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
If Alias_Thalmor1.GetActorReference().IsDead() && Alias_Thalmor2.GetActorReference().IsDead() && Alias_Thalmor3.GetActorReference().IsDead()
alias_Alusannah.GetActorReference().EvaluatePackage()
alias_Namasur.GetActorReference().EvaluatePackage()
alias_Modhna.GetActorReference().EvaluatePackage()
Stop()
endif

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
