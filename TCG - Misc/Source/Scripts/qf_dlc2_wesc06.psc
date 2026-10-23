;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname QF_DLC2_WESC06 Extends Quest Hidden

;BEGIN ALIAS PROPERTY AppropriateLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AppropriateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireDestination
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_YsoldaWickhamDestination Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hunter02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hunter02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY YsoldaWickham
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_YsoldaWickham Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY YsoldaWickhamNameReplacement
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_YsoldaWickhamNameReplacement Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Both hunters are dead. Start Forcegreet if Ysolda Wickham is still alive.
;Debug.Trace("Stage 30 - All Hunters Dead" + "Alias_YsoldaWickham.GetReference().Is3DLoaded() + Alias_Hunter01.GetReference().Is3DLoaded() + Alias_Hunter02.GetReference().Is3DLoaded()")
Alias_YsoldaWickham.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Any of the two hunters are killed.
;Debug.Trace("Stage 20 - First of Two Hunters are Dead" + "Alias_YsoldaWickham.GetReference().Is3DLoaded() + Alias_Hunter01.GetReference().Is3DLoaded() + Alias_Hunter02.GetReference().Is3DLoaded()")
if (Alias_Hunter01.GetActorRef().IsDead() && Alias_Hunter02.GetActorRef().IsDead())
     SetStage(30)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Actor Ysolda = Alias_YsoldaWickham.GetActorReference()
Faction CrimeFactionEastmarch = Game.GetFormFromFile(0x000267E3, "Skyrim.esm") as Faction
Faction CrimeFactionFalkreath = Game.GetFormFromFile(0x00028170, "Skyrim.esm") as Faction
Faction CrimeFactionHaafingar = Game.GetFormFromFile(0x00029DB0, "Skyrim.esm") as Faction
Faction CrimeFactionHjaalmarch = Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction
Faction CrimeFactionPale = Game.GetFormFromFile(0x0002816E, "Skyrim.esm") as Faction
Faction CrimeFactionReach = Game.GetFormFromFile(0x0002816C, "Skyrim.esm") as Faction
Faction CrimeFactionRift = Game.GetFormFromFile(0x0002816B, "Skyrim.esm") as Faction
Faction CrimeFactionWhiterun = Game.GetFormFromFile(0x000267EA, "Skyrim.esm") as Faction
Faction CrimeFactionWinterhold = Game.GetFormFromFile(0x0002816F, "Skyrim.esm") as Faction
Faction DLC1VampireCrimeFaction = Game.GetFormFromFile(0x00017F71, "Dawnguard.esm") as Faction

;Fleeing Ysolda Wickham is killed.
;Debug.Trace("Stage 10 - Ysolda Wickham Dead" + "Alias_YsoldaWickham.GetReference().Is3DLoaded() + Alias_Hunter01.GetReference().Is3DLoaded() + Alias_Hunter02.GetReference().Is3DLoaded()")

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionHaafingar) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionHaafingar)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionReach) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionReach)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionHjaalmarch) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionHjaalmarch)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionWhiterun) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionWhiterun)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionFalkreath) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionFalkreath)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionPale) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionPale)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionWinterhold) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionWinterhold)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionEastmarch) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionEastmarch)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionRift) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionRift)
endif

Ysolda.SetCrimeFaction(DLC1VampireCrimeFaction)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Actor Ysolda = Alias_YsoldaWickham.GetActorReference()
Faction CrimeFactionEastmarch = Game.GetFormFromFile(0x000267E3, "Skyrim.esm") as Faction
Faction CrimeFactionFalkreath = Game.GetFormFromFile(0x00028170, "Skyrim.esm") as Faction
Faction CrimeFactionHaafingar = Game.GetFormFromFile(0x00029DB0, "Skyrim.esm") as Faction
Faction CrimeFactionHjaalmarch = Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction
Faction CrimeFactionPale = Game.GetFormFromFile(0x0002816E, "Skyrim.esm") as Faction
Faction CrimeFactionReach = Game.GetFormFromFile(0x0002816C, "Skyrim.esm") as Faction
Faction CrimeFactionRift = Game.GetFormFromFile(0x0002816B, "Skyrim.esm") as Faction
Faction CrimeFactionWhiterun = Game.GetFormFromFile(0x000267EA, "Skyrim.esm") as Faction
Faction CrimeFactionWinterhold = Game.GetFormFromFile(0x0002816F, "Skyrim.esm") as Faction
Faction DLC1VampireCrimeFaction = Game.GetFormFromFile(0x00017F71, "Dawnguard.esm") as Faction

;Forcegreet complete.
;Debug.Trace("Stage 40 - Forcegreet Complete" + "Alias_YsoldaWickham.GetReference().Is3DLoaded() + Alias_Hunter01.GetReference().Is3DLoaded() + Alias_Hunter02.GetReference().Is3DLoaded()")
Alias_YsoldaWickhamNameReplacement.ForceRefTo(Alias_YsoldaWickham.GetActorRef())
Alias_YsoldaWickham.GetActorRef().RemoveFromFaction(DLC1VolkiharClanFaction)
ObjectReference obj
if (Alias_YsoldaWickham.GetActorRef().GetItemCount(DLC1VolkiharVampireOutfitRed) > 0)
     Alias_YsoldaWickham.GetActorRef().RemoveItem(DLC1VolkiharVampireOutfitRed)
     obj = Alias_YsoldaWickham.GetActorRef().PlaceAtMe(DLC1VolkiharVampireOutfitRed)
     obj.MoveTo(obj, 0, 0, 5)
     Alias_YsoldaWickham.GetActorRef().EquipItem(ReplacementClothes, True, True)
EndIf
if (Alias_YsoldaWickham.GetActorRef().GetItemCount(VampireAmulet) > 0)
     Alias_YsoldaWickham.GetActorRef().RemoveItem(VampireAmulet)
     obj = Alias_YsoldaWickham.GetActorRef().PlaceAtMe(VampireAmulet)
     obj.MoveTo(obj, 0, 0, 15)
EndIf
if (Alias_YsoldaWickham.GetActorRef().GetItemCount(DLC2_WESC06Orders) > 0)
     Alias_YsoldaWickham.GetActorRef().RemoveItem(DLC2_WESC06Orders)
     obj = Alias_YsoldaWickham.GetActorRef().PlaceAtMe(DLC2_WESC06Orders)
     obj.MoveTo(obj, 0, 0, 25)
EndIf
if (Alias_YsoldaWickham.GetActorRef().GetItemCount(CacheKey) > 0)
     Alias_YsoldaWickham.GetActorRef().RemoveItem(CacheKey)
     obj = Alias_YsoldaWickham.GetActorRef().PlaceAtMe(CacheKey)
     obj.MoveTo(obj, 0, 0, 20)
EndIf
if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionHaafingar) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionHaafingar)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionReach) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionReach)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionHjaalmarch) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionHjaalmarch)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionWhiterun) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionWhiterun)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionFalkreath) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionFalkreath)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionPale) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionPale)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionWinterhold) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionWinterhold)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionEastmarch) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionEastmarch)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionRift) == 1
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionRift)
endif

Alias_YsoldaWickham.GetActorRef().EvaluatePackage()
Ysolda.SetCrimeFaction(DLC1VampireCrimeFaction)
Stop()
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
Actor Ysolda = Alias_YsoldaWickham.GetActorReference()
Faction CrimeFactionEastmarch = Game.GetFormFromFile(0x000267E3, "Skyrim.esm") as Faction
Faction CrimeFactionFalkreath = Game.GetFormFromFile(0x00028170, "Skyrim.esm") as Faction
Faction CrimeFactionHaafingar = Game.GetFormFromFile(0x00029DB0, "Skyrim.esm") as Faction
Faction CrimeFactionHjaalmarch = Game.GetFormFromFile(0x0002816D, "Skyrim.esm") as Faction
Faction CrimeFactionPale = Game.GetFormFromFile(0x0002816E, "Skyrim.esm") as Faction
Faction CrimeFactionReach = Game.GetFormFromFile(0x0002816C, "Skyrim.esm") as Faction
Faction CrimeFactionRift = Game.GetFormFromFile(0x0002816B, "Skyrim.esm") as Faction
Faction CrimeFactionWhiterun = Game.GetFormFromFile(0x000267EA, "Skyrim.esm") as Faction
Faction CrimeFactionWinterhold = Game.GetFormFromFile(0x0002816F, "Skyrim.esm") as Faction
Faction DLC1VampireCrimeFaction = Game.GetFormFromFile(0x00017F71, "Dawnguard.esm") as Faction

;Debug.Trace("Starting Vampires")
Utility.Wait(10)

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionHaafingar) == 1 && (!Alias_YsoldaWickham.GetReference().Is3DLoaded())
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionHaafingar)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionReach) == 1 && (!Alias_YsoldaWickham.GetReference().Is3DLoaded())
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionReach)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionHjaalmarch) == 1 && (!Alias_YsoldaWickham.GetReference().Is3DLoaded())
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionHjaalmarch)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionWhiterun) == 1 && (!Alias_YsoldaWickham.GetReference().Is3DLoaded())
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionWhiterun)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionFalkreath) == 1 && (!Alias_YsoldaWickham.GetReference().Is3DLoaded())
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionFalkreath)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionPale) == 1 && (!Alias_YsoldaWickham.GetReference().Is3DLoaded())
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionPale)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionWinterhold) == 1 && (!Alias_YsoldaWickham.GetReference().Is3DLoaded())
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionWinterhold)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionEastmarch) == 1 && (!Alias_YsoldaWickham.GetReference().Is3DLoaded())
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionEastmarch)
endif

if Alias_YsoldaWickham.GetActorReference().IsInFaction(CrimeFactionRift) == 1 && (!Alias_YsoldaWickham.GetReference().Is3DLoaded())
   Alias_YsoldaWickham.GetActorReference().RemoveFromFaction(CrimeFactionRift)
endif

if (!Alias_YsoldaWickham.GetReference().Is3DLoaded())
Ysolda.SetCrimeFaction(DLC1VampireCrimeFaction)
Stop()
else
Utility.Wait(5)
;Debug.Trace("Starting Hunters")
if !getstagedone(10)
Alias_Hunter01.GetReference().Enable()
Alias_Hunter02.GetReference().Enable()
endif
EndIf
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
Alias_YsoldaWickham.GetReference().DeleteWhenAble()
EndIf

Alias_Hunter01.GetReference().DeleteWhenAble()
Alias_Hunter02.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction Property DLC1VolkiharClanFaction  Auto  
Armor Property ReplacementClothes  Auto  
Book Property DLC2_WESC06Orders  Auto  
Armor Property VampireAmulet  Auto  
Key Property CacheKey  Auto  
Armor Property DLC1VolkiharVampireOutfitRed  Auto  
