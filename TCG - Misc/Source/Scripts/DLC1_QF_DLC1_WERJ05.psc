;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname DLC1_QF_DLC1_WERJ05 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dawnguard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dawnguard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostEncounterSandboxRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSandboxRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Dawnguard.GetReference().DeleteWhenAble()
Alias_Victim.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(self + "stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Actor Dawnguard = Alias_Dawnguard.GetReference() as Actor
Actor playerRef = game.getPlayer()
Actor Victim = Alias_Victim.GetReference() as Actor
Dawnguard.setActorValue( "Aggression", 2 ) ;USSEP 4.3.4 Bug #34500
Victim.setActorValue( "Aggression", 2 ) ;USSEP 4.3.4 Bug #34500
Dawnguard.startCombat(playerRef)
Victim.startCombat(playerRef)
Utility.Wait(5) ; give time to scene attack start properly
CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
