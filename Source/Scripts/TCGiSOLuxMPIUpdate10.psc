;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate10 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update

if VQ03.GetStageDone(200) == 1
  VampireBase.setStage(300)
Endif

Stop()
;END CODE
EndFunction
;END FRAGMENT  
;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property VampireBase Auto
Quest Property VQ03 Auto