;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate09 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update

if DLC1IntroCompletedVampire.GetValue() == 1
  SolitudeOpening.setStage(200)
Endif

Stop()
;END CODE
EndFunction
;END FRAGMENT  
GlobalVariable Property DLC1IntroCompletedVampire  Auto
Quest Property SolitudeOpening  Auto 