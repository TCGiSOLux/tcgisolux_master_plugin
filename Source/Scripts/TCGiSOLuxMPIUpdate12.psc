;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate12 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Uthgerd
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Uthgerd Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update
Alias_Uthgerd.GetActorReference().Reset()
Utility.Wait(3)
Alias_Uthgerd.GetActorReference().GetActorBase().SetEssential(true)

CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT  

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

