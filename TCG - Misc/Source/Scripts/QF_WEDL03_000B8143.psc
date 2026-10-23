;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_WEDL03_000B8143 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Husband
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Husband Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wife
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wife Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Solitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Solitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bodyguard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bodyguard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
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

;BEGIN ALIAS PROPERTY ScriptManager2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScriptManager2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ScriptManager1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScriptManager1 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
GlobalVariable WECarvainsKilled = Game.GetFormFromFile( 0x000B91A8, "Skyrim.esm" ) as GlobalVariable
Quest WEDL04 = Game.GetFormFromFile( 0x000B91D8, "Skyrim.esm" ) as Quest

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
Alias_ScriptManager1.GetReference().Delete()
Alias_ScriptManager2.GetReference().Delete()

if GetStageDone(100)
Alias_Husband.GetReference().Delete()
Alias_Wife.GetReference().Delete()
Alias_Bodyguard.GetReference().DeleteWhenAble()
endif

if GetStageDone(200)
Alias_Bodyguard.GetReference().Delete()
Alias_Husband.GetReference().DeleteWhenAble()
Alias_Wife.GetReference().DeleteWhenAble()
endif

if !GetStageDone(100) && !GetStageDone(200)
Alias_Bodyguard.GetReference().Delete()
Alias_Husband.GetReference().Delete()
Alias_Wife.GetReference().Delete()
endif

if WECarvainsKilled.getValue() == 1
WEDL04.CompleteQuest()
CompleteQuest()
endif

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Script Manager are unloaded.
; debug.trace(self + "stage 230")
;Debug.Trace("230: "Alias_ScriptManager1.GetReference().Is3DLoaded() + Alias_ScriptManager2.GetReference().Is3DLoaded()")
if !getstagedone(100) || !getstagedone(200)
Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; debug.trace(self + "stage 50")
;Player reached to Travel Maker.
;Carvains and Bodyguard are spawned in.
Alias_Wife.TryToEnable()
Alias_Husband.TryToEnable()
Alias_BodyGuard.TryToEnable()
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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("100: "Alias_ScriptManager1.GetReference().Is3DLoaded() + Alias_ScriptManager2.GetReference().Is3DLoaded() + Alias_Wife.GetReference().Is3DLoaded() + Alias_Husband.GetReference().Is3DLoaded() + Alias_BodyGuard.GetReference().Is3DLoaded()")
;player has chosen attack dialog option or has attacked them
WEDL03Faction.setEnemy(PlayerFaction)
(alias_Bodyguard.getReference() as actor).setAV("Aggression",1)
(alias_Wife.getReference() as actor).setAV("Aggression",3)
(alias_Husband.getReference() as actor).setAV("Aggression",3)
(alias_Bodyguard.getReference() as actor).startCombat(game.getPlayer())
(alias_Bodyguard.getReference() as actor).evaluatePackage()
(alias_Husband.getReference() as actor).evaluatePackage()
(alias_Wife.getReference() as actor).evaluatePackage()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;bodyguard killed, Couple should run for their lives
;Debug.Trace("200: "Alias_ScriptManager1.GetReference().Is3DLoaded() + Alias_ScriptManager2.GetReference().Is3DLoaded() + Alias_Wife.GetReference().Is3DLoaded() + Alias_Husband.GetReference().Is3DLoaded() + Alias_BodyGuard.GetReference().Is3DLoaded()")
if !getstagedone(230)
Alias_Husband.GetActorReference().evaluatePackage()
Alias_Wife.GetActorReference().evaluatePackage()
Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction Property WEDL03Faction  Auto  
Faction Property PlayerFaction  Auto  
