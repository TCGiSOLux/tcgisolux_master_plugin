;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_WE00_0004A602 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cultist
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; debug.trace(self + "stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;cultist dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player taken book make complete quest and stop
(Game.GetFormFromFile(0x0004D8D6, "Skyrim.esm" ) as Quest).setstage(1)
setObjectiveCompleted(10,1)
CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;cultist start combat
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
Alias_Cultist.GetReference().DeleteWhenAble()

if !GetStageDone(20)
setObjectiveDisplayed(10,0)
else
SetObjectiveCompleted(10)
endif

(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
quest property weda02 auto 
