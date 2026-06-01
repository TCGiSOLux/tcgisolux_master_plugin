;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate14 Extends Quest Hidden

;BEGIN ALIAS PROPERTY UthgerdTorbaldsen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UthgerdTorbaldsen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HekatahMoabul
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HekatahMoabul Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update
if DLC1RV10.GetStageDone(10) == 1 && DLC1RV10.GetStageDone(255) == 1
  Alias_UthgerdTorbaldsen.GetActorReference().GetActorBase().SetEssential(False)
  Alias_HekatahMoabul.GetActorReference().GetActorBase().SetEssential(False)
  Utility.Wait(2)
  Alias_UthgerdTorbaldsen.GetActorReference().Kill(game.getPlayer())
  Alias_HekatahMoabul.GetActorReference().Kill(game.getPlayer())
Endif

CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT  

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property DLC1RV10  Auto 