;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_TIF__0202C090 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DialogueCrimeGuards.SetupCidhnaMine()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pCrimeReachFaction.SendPlayerToJail()
MS02.setstage(5)
MS01GuardAmbushQuest.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
CrimeGuardsScript Property DialogueCrimeGuards  Auto  
Quest Property MS02  Auto  
Quest Property MS01GuardAmbushQuest  Auto  
Faction Property pCrimeReachFaction  Auto  
