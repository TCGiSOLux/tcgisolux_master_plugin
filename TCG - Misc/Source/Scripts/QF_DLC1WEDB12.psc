;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_DLC1WEDB12 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SarthisIdren
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_SarthisIdren Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OriniDral
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_OriniDral Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alva
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Alva Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireAssassin2
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_VampireAssassin2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker4
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_SceneMarker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaeletteVamp
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_LaeletteVamp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireAssassin1
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_VampireAssassin1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Movarth
;ALIAS PROPERTY TYPE referenceAlias
referenceAlias Property Alias_Movarth Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
Utility.Wait(3)
Alias_SarthisIdren.GetReference().Delete()
Alias_OriniDral.GetReference().Delete()

if (Alias_Alva.GetActorReference() != None)
     Alias_Alva.GetReference().DeleteWhenAble()
EndIf

alias_VampireAssassin1.GetReference().DeleteWhenAble()
alias_VampireAssassin2.GetReference().DeleteWhenAble()

alias_LaeletteVamp.GetReference().DeleteWhenAble()
alias_Movarth.GetReference().DeleteWhenAble()

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

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
