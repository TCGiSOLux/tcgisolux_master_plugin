;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate04 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Spouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spouse Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if Alias_Spouse.GetActorReference().IsInFaction(PlayerMarriedFaction) == 1 && DLC1RV06DoOnce.GetValue() == 1 && Alias_Spouse.GetActorReference().IsInFaction(DLC1VampireCrimeFaction) == 1 && DLC1RV06.GetStageDone(255) == 1
   Alias_Spouse.GetActorReference().AddToFaction(DLC1RQTF)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property DLC1RV06  Auto  
GlobalVariable property DLC1RV06DoOnce AUTO
Faction Property DLC1VampireCrimeFaction  Auto  
Faction Property PlayerMarriedFaction Auto
Faction Property DLC1RQTF  Auto  
