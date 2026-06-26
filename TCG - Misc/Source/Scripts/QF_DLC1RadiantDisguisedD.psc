;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DLC1RadiantDisguisedD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Dawnguard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dawnguard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
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

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE

;START COMBAT

int count = 0
while (count < AttackDisguisedDawnguard.length)
DawnguardDisguised.SetEnemy(AttackDisguisedDawnguard[count])
count += 1
endwhile

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

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;debug.trace(self + "stage 255, shutting down deletewhenable() Dawnguard")

if (GetStageDone(200) == 0)
int count = 0
while (count < AttackDisguisedDawnguard.length)
DawnguardDisguised.SetEnemy(AttackDisguisedDawnguard[count], true, true)
count += 1
endwhile
endif

Alias_Dawnguard.GetReference().DeleteWhenAble()

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DawnguardDisguised auto
Faction[] Property AttackDisguisedDawnguard auto
