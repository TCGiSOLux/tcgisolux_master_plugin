;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate05 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NPC1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NPC5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NPC5 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_NPC1.GetActorReference().AddToFaction(DLC1VolkiharClanFaction)
Alias_NPC2.GetActorReference().AddToFaction(DLC1VolkiharClanFaction)
Alias_NPC3.GetActorReference().AddToFaction(DLC1VolkiharClanFaction)
Alias_NPC4.GetActorReference().AddToFaction(DLC1VolkiharClanFaction)
Alias_NPC5.GetActorReference().AddToFaction(DLC1VolkiharClanFaction)

CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction Property DLC1VolkiharClanFaction  Auto  
Faction Property DLC1VampireCrimeFaction Auto
