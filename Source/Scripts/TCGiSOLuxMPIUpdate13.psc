;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate13 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update
if MS05Start.GetStage() == 0 && MS05Rumor.GetStage() == 0
  SolitudeBardsCollege.SetPublic(false)
Endif
Stop()
;END CODE
EndFunction
;END FRAGMENT  
Cell Property SolitudeBardsCollege Auto
Quest Property MS05Rumor  Auto  
Quest Property MS05Start  Auto 