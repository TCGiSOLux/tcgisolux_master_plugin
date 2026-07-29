;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate20 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE TCGiSOLuxMPIUpdate20Functions
Quest __temp = self as Quest
TCGiSOLuxMPIUpdate20Functions kmyQuest = __temp as TCGiSOLuxMPIUpdate20Functions
;END AUTOCAST
;BEGIN CODE
;Start update Daedric Quest
kmyQuest.DaedraQuest()
SetStage(10)
;END CODE
EndFunction

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE TCGiSOLuxMPIUpdate20Functions
Quest __temp = self as Quest
TCGiSOLuxMPIUpdate20Functions kmyQuest = __temp as TCGiSOLuxMPIUpdate20Functions
;END AUTOCAST
;BEGIN CODE
;Start update Vampirism
kmyQuest.VampirismSystem()
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE TCGiSOLuxMPIUpdate20Functions
Quest __temp = self as Quest
TCGiSOLuxMPIUpdate20Functions kmyQuest = __temp as TCGiSOLuxMPIUpdate20Functions
;END AUTOCAST
;BEGIN CODE
;Start update DGArrestingGuardVoiceTypes formlist
kmyQuest.NewGuardVO()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
