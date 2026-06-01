;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000C593E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
T01Intro.Start()
T01ReadyToStart.SetValue(1)
InnerSanctum.SetPublic(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property T01Intro  Auto  

GlobalVariable Property T01ReadytoStart  Auto  

Cell Property InnerSanctum  Auto  
