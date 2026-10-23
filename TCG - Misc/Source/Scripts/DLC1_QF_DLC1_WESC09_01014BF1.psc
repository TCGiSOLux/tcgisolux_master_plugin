;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname DLC1_QF_DLC1_WESC09_01014BF1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Taron
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Taron Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Dialogue with Taron begins. Block further instances of this event.
;Debug.Trace("Stage 10 - Dialogue Started")
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
;Debug.Trace("Spawning Taron and Guards")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Taron Dreth and Guards are unloaded.
;Debug.Trace("Stage 100: "Alias_Taron.GetReference().Is3DLoaded() + Alias_Guard01.GetReference().Is3DLoaded() + Alias_Guard02.GetReference().Is3DLoaded() + Alias_Guard03.GetReference().Is3DLoaded()")

Alias_Taron.GetActorRef().RemoveFromFaction(Game.GetFormFromFile(0x0001DD09, "Skyrim.esm") as Faction)
Alias_Guard01.GetActorRef().RemoveFromFaction(Game.GetFormFromFile(0x0001DD09, "Skyrim.esm") as Faction)
Alias_Guard02.GetActorRef().RemoveFromFaction(Game.GetFormFromFile(0x0001DD09, "Skyrim.esm") as Faction)
Alias_Guard03.GetActorRef().RemoveFromFaction(Game.GetFormFromFile(0x0001DD09, "Skyrim.esm") as Faction)

if !GetStageDone(50)
Alias_Taron.GetActorReference().kill()
Alias_Guard01.GetActorReference().kill()
Alias_Guard02.GetActorReference().kill()
Alias_Guard03.GetActorReference().kill()
CompleteQuest()
DLC1_WESC09Faction.SetEnemy(PlayerFaction)
Stop()
endif

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Begin combat with Taron and guards.
;Debug.Trace("Stage 50 - Starting Combat" + "Alias_Taron.GetReference().Is3DLoaded() + Alias_Guard01.GetReference().Is3DLoaded() + Alias_Guard02.GetReference().Is3DLoaded() + Alias_Guard03.GetReference().Is3DLoaded()")
Alias_Taron.GetActorRef().RemoveFromFaction(Game.GetFormFromFile(0x0001DD09, "Skyrim.esm") as Faction)
Alias_Guard01.GetActorRef().RemoveFromFaction(Game.GetFormFromFile(0x0001DD09, "Skyrim.esm") as Faction)
Alias_Guard02.GetActorRef().RemoveFromFaction(Game.GetFormFromFile(0x0001DD09, "Skyrim.esm") as Faction)
Alias_Guard03.GetActorRef().RemoveFromFaction(Game.GetFormFromFile(0x0001DD09, "Skyrim.esm") as Faction)
Alias_Taron.GetActorRef().EvaluatePackage()
Alias_Guard01.GetActorRef().EvaluatePackage()
Alias_Guard02.GetActorRef().EvaluatePackage()
Alias_Guard03.GetActorRef().EvaluatePackage()
DLC1_WESC09Faction.SetEnemy(PlayerFaction)
CompleteQuest()
Stop()
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
;debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()

if (!GetStageDone(100))
Alias_Taron.GetActorRef().DeleteWhenAble()
endif
Alias_Guard01.GetActorRef().DeleteWhenAble()
Alias_Guard02.GetActorRef().DeleteWhenAble()
Alias_Guard03.GetActorRef().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Dialogue flag: Player selects the 'I Made It' dialogue choice.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction Property DLC1_WESC09Faction  Auto  
Faction Property PlayerFaction  Auto  
