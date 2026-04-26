;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate11 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update

if EnterMarkarthCount.GetValue() <= 3 && T01.GetStage() <= 50
  T01.Stop()
  T01Prologue.Stop()
Endif

Stop()
;END CODE
EndFunction
;END FRAGMENT  
GlobalVariable Property EnterMarkarthCount  Auto  
Quest Property T01  Auto  
Quest Property T01Prologue  Auto 