;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname DLC1WESC10 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dawnguard01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dawnguard01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AppropriateLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AppropriateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireDestination
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampireDestination Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dawnguard02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dawnguard02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireNameReplacement
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampireNameReplacement Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Forcegreet complete.
;Debug.Trace("Stage 40 - Forcegreet Complete")
Alias_VampireNameReplacement.ForceRefTo(Alias_Vampire.GetActorRef())
Alias_Vampire.GetActorRef().RemoveFromFaction(DLC1VolkiharClanFaction)
ObjectReference obj
if (Alias_Vampire.GetActorRef().GetItemCount(DLC1VolkiharVampireOutfitRed) > 0)
     Alias_Vampire.GetActorRef().RemoveItem(DLC1VolkiharVampireOutfitRed)
     obj = Alias_Vampire.GetActorRef().PlaceAtMe(DLC1VolkiharVampireOutfitRed)
     obj.MoveTo(obj, 0, 0, 5)
     Alias_Vampire.GetActorRef().EquipItem(ReplacementClothes, True, True)
EndIf
if (Alias_Vampire.GetActorRef().GetItemCount(VampireAmulet) > 0)
     Alias_Vampire.GetActorRef().RemoveItem(VampireAmulet)
     obj = Alias_Vampire.GetActorRef().PlaceAtMe(VampireAmulet)
     obj.MoveTo(obj, 0, 0, 15)
EndIf
if (Alias_Vampire.GetActorRef().GetItemCount(DLC1_WESC10Orders) > 0)
     Alias_Vampire.GetActorRef().RemoveItem(DLC1_WESC10Orders)
     obj = Alias_Vampire.GetActorRef().PlaceAtMe(DLC1_WESC10Orders)
     obj.MoveTo(obj, 0, 0, 25)
EndIf
if (Alias_Vampire.GetActorRef().GetItemCount(CacheKey) > 0)
     Alias_Vampire.GetActorRef().RemoveItem(CacheKey)
     obj = Alias_Vampire.GetActorRef().PlaceAtMe(CacheKey)
     obj.MoveTo(obj, 0, 0, 20)
EndIf
Alias_Vampire.GetActorRef().EvaluatePackage()
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
if (!GetStageDone(10))
     Alias_Vampire.GetReference().DeleteWhenAble()
EndIf
Alias_Dawnguard01.GetReference().DeleteWhenAble()
Alias_Dawnguard02.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Any of the three Dawnguard are killed.
;Debug.Trace("Stage 20 - Dawnguard Dead")
if (Alias_Dawnguard01.GetActorRef().IsDead() && Alias_Dawnguard02.GetActorRef().IsDead())
     SetStage(30)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Fleeing Vampire is killed.
;Debug.Trace("Stage 10 - Vampire Dead")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;All three Dawnguard dead. Start Forcegreet if Mivryna Beloren is still alive.
;Debug.Trace("Stage 30 - All Dawnguard Dead")
Alias_Vampire.GetActorRef().EvaluatePackage()
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
;Debug.Trace("Starting Vampires")
Utility.Wait(5)
;Debug.Trace("Starting Dawnguard")
Alias_Dawnguard01.GetReference().Enable()
Alias_Dawnguard02.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC1VolkiharClanFaction  Auto  

Armor Property ReplacementClothes  Auto  

Book Property DLC1_WESC10Orders  Auto  

Armor Property VampireAmulet  Auto  

Key Property CacheKey  Auto  

Armor Property DLC1VolkiharVampireOutfitRed  Auto  
