;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate01 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update
;FIX INCORRECTLY OWNERSHIPS
BattleBornFarm.SetFactionOwner(WhiterunHouseBattleBornFaction)
MarkarthHalloftheDead.SetFactionOwner(MarkarthHallofDeadFaction)
BattleBornFarm.SetPublic(true)
Utility.Wait(2)
BattleBornFarm.SetPublic(false)
Utility.Wait(2)

;FIX INCORRECTLY CRIME FACTIONS
if Alias_NPC1.GetActorReference().IsInFaction(CrimeFactionWinterhold) == 1 && Alias_NPC1.GetActorReference().IsInFaction(DLC1VampireCrimeFaction) == 0
   Alias_NPC1.GetActorReference().RemoveFromFaction(CrimeFactionWinterhold)
   Alias_NPC1.GetActorReference().AddToFaction(CrimeFactionEastmarch)
   Alias_NPC1.GetActorReference().SetCrimeFaction(CrimeFactionEastmarch)
endif

if Alias_NPC2.GetActorReference().IsInFaction(CrimeFactionWinterhold) == 1
   Alias_NPC2.GetActorReference().RemoveFromFaction(CrimeFactionWinterhold)
   Alias_NPC2.GetActorReference().AddToFaction(CrimeFactionEastmarch)
   Alias_NPC2.GetActorReference().SetCrimeFaction(CrimeFactionEastmarch)
endif

if Alias_NPC3.GetActorReference().IsInFaction(CrimeFactionWinterhold) == 1 && Alias_NPC3.GetActorReference().IsInFaction(DLC1VampireCrimeFaction) == 0
   Alias_NPC3.GetActorReference().RemoveFromFaction(CrimeFactionWinterhold)
   Alias_NPC3.GetActorReference().AddToFaction(CrimeFactionEastmarch)
   Alias_NPC3.GetActorReference().SetCrimeFaction(CrimeFactionEastmarch)
endif

;FIX QUEST THE HEART OF DIBELLA AFTER COMPLETING STILL RUNNING
If T01.GetStageDone(200) == 1 && T01.IsRunning() == True
  T01.stop()
Endif

;FIX GUARD WARN PLAYER TO STOP ENTER DWEMER MUSEUM WITHOUT PERMISSION TO CALCELMO
If T02.GetStageDone(70) == 1 && TG06.GetStageDone(25) == 1 && dmWQQST.GetStageDone(1) == 1 && FreeformMarkarthO.GetStageDone(20) == 0 && DialogueMarkarth.GetStageDone(120) == 0
  DialogueMarkarth.SetStage(120)
Endif

;Update completed
Stop()
;END CODE
EndFunction
;END FRAGMENT
;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction Property CrimeFactionWinterhold Auto
Faction Property CrimeFactionEastmarch Auto
Faction Property WhiterunHouseBattleBornFaction Auto
Faction Property MarkarthHallofDeadFaction Auto
Faction Property DLC1VampireCrimeFaction Auto
Quest Property T01  Auto  
Quest Property T02  Auto  
Quest Property TG06  Auto  
Quest Property dmWQQST  Auto  
Quest Property FreeformMarkarthO  Auto  
Quest Property DialogueMarkarth  Auto  
Cell Property BattleBornFarm Auto
Cell Property MarkarthHalloftheDead Auto