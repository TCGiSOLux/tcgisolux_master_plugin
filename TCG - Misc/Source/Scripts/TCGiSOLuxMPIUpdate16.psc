;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate16 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update
if DLC1VQ02.GetStageDone(180) == 1 && DLC1VampireBaseIntro.GetStageDone(10) == 0
DLC1VampireBaseIntro.Start()
DLC1VampireBaseIntro.SetStage(0)
CompleteQuest()
Stop()
else
stop()
endif

;END CODE
EndFunction
;END FRAGMENT  

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property DLC1VampireBaseIntro  Auto  
Quest Property DLC1VQ02  Auto  
