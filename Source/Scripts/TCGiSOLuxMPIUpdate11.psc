;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate11 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update

if T01ReadytoStart.GetValue() == 0
  InnerSanctum.SetPublic(false)
Endif

CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
GlobalVariable Property T01ReadytoStart  Auto  
Cell Property InnerSanctum Auto
