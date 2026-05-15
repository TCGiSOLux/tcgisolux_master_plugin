
;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname SwapSorliCrimeFactionQF Extends Quest Hidden

;BEGIN ALIAS PROPERTY Sorli
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sorli Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Debug.Trace("CW DLC1RV07: Swapping Sorli's the Builder crime faction from DLC1VampireCrimeFaction to CrimeFactionHjaalmarch on her promotion to government.")
if Alias_Sorli.GetActorReference().IsInFaction(DLC1VampireCrimeFaction) == 1
Alias_Sorli.GetActorReference().RemoveFromFaction(DLC1VampireCrimeFaction)
Alias_Sorli.GetActorReference().AddToFaction(CrimeFactionHjaalmarch)
Alias_Sorli.GetActorReference().SetCrimeFaction(CrimeFactionHjaalmarch)
Stop()
else
; Debug.Trace("CW DLC1RV07: Sorli's the Builder crime faction in DLC1VampireCrimeFaction are not found, skipping.")
Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC1VampireCrimeFaction  Auto  
Faction Property CrimeFactionHjaalmarch  Auto  
