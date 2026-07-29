;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DLC1RadiantDisguisedD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Dawnguard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dawnguard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE DLC1RadiantDisguisedDawnguardScript
Quest __temp = self as Quest
DLC1RadiantDisguisedDawnguardScript kmyQuest = __temp as DLC1RadiantDisguisedDawnguardScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + "stage 255, shutting down deletewhenable() Dawnguard")

Alias_Dawnguard.GetReference().DeleteWhenAble()
kmyQuest.DawnguardDisguisedDelete()
kmyQuest.SetNeutralFactionsToAttackDawnguardDisguised()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DLC1RadiantDisguisedDawnguardScript
Quest __temp = self as Quest
DLC1RadiantDisguisedDawnguardScript kmyQuest = __temp as DLC1RadiantDisguisedDawnguardScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetAllyFactionsToAttackDawnguardDisguised()
kmyQuest.DawnguardDisguisedStartCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;debug.trace(self + "stage 0")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property VampirePCFactionB auto
Faction Property VampirePCFactionA auto
Faction Property DawnguardDisguised auto
Faction[] Property AttackDisguisedDawnguard auto
