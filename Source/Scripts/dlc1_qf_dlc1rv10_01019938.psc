;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC1_QF_DLC1RV10_01019938 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Sorine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sorine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Door
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Door Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Florentius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Florentius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Isran
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Isran Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Agmaer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Agmaer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Durak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Durak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Beleval
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Beleval Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Celann
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Celann Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gunmar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gunmar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ingjard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ingjard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ingmarne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ingmarne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jill
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jill Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sillina
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sillina Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tristyval
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tristyval Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kirsten
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kirsten Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UthgerdTorbaldsen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UthgerdTorbaldsen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HekatahMoabul
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HekatahMoabul Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Quest completed. Remove hostility Dawnguard agents to Volkihar Clan.
DLC1DialogueHunterBase.Stop()
DLC1DialogueHunterVampireBlock.Stop()
DawnguardAgents.Stop()
CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 25)
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)
DLC1DawnguardHQ01.SetFactionOwner(DLC1HunterFaction) ; Added By TCGiSOLux Master Plugin Interior
DLC1DawnguardHQ01.SetPublic(false) ; Added By TCGiSOLux Master Plugin Interior
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC1RV10Script
Quest __temp = self as Quest
DLC1RV10Script kmyQuest = __temp as DLC1RV10Script
;END AUTOCAST
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)
DLC1RV10DoOnce.SetValue(1)
If DLC1VQ01MiscObjective.GetStageDone(200) == 1 && DLC1VQ01MiscObjective.GetStageDone(250) == 0
  DLC1VQ01MiscObjective.setStage(250) ; Added By TCGiSOLux Master Plugin Interior
Endif
DLC1DawnguardHQ01.SetFactionOwner(DLC1HunterFaction) ; Added By TCGiSOLux Master Plugin Interior
DLC1DawnguardHQ01.SetPublic(true) ; Added By TCGiSOLux Master Plugin Interior
Alias_MapMarker.GetReference().AddToMap()
SetObjectiveDisplayed(10)

Alias_Door.GetReference().SetLockLevel(0)
Alias_Door.GetReference().Lock(False)
kmyquest.StripEssentialAndEnable(Alias_Isran)
kmyquest.StripEssentialAndEnable(Alias_Sorine)
kmyquest.StripEssentialAndEnable(Alias_Gunmar)
kmyquest.StripEssentialAndEnable(Alias_Florentius)
kmyquest.StripEssentialAndEnable(Alias_Agmaer)
kmyquest.StripEssentialAndEnable(Alias_Beleval)
kmyquest.StripEssentialAndEnable(Alias_Celann)
kmyquest.StripEssentialAndEnable(Alias_Durak)
kmyquest.StripEssentialAndEnable(Alias_Ingjard) ; Added By TCGiSOLux Master Plugin Interior
kmyquest.StripEssentialAndEnable(Alias_Kirsten) ; Added By TCGiSOLux Master Plugin Interior
kmyquest.StripEssentialAndEnable(Alias_Tristyval) ; Added By TCGiSOLux Master Plugin Interior
kmyquest.StripEssentialAndEnable(Alias_Sillina) ; Added By TCGiSOLux Master Plugin Interior
kmyquest.StripEssentialAndEnable(Alias_Jill) ; Added By TCGiSOLux Master Plugin Interior
kmyquest.StripEssentialAndEnable(Alias_Ingmarne) ; Added By TCGiSOLux Master Plugin Interior
kmyquest.StripEssentialAndEnable(Alias_HekatahMoabul) ; Added By TCGiSOLux Master Plugin Interior
kmyquest.StripEssentialAndEnable(Alias_UthgerdTorbaldsen) ; Added By TCGiSOLux Master Plugin Interior
DLC1DawnguardGateRef1.Disable()
DLC1DawnguardGateRef2.Disable()
DLC1DawnguardGateRef3.Disable()

Alias_Sorine.GetActorReference().SetOutfit(kmyquest.DLC1OutfitSorine)
Alias_Gunmar.GetActorReference().SetOutfit(kmyquest.DLC1OutfitGunmar)
Alias_Florentius.GetActorReference().SetOutfit(DLC1FlorentiusOutfit) ; Added by UDGP 1.1.3
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DLC1RadiantScript Property DLC1Radiant  Auto  
ObjectReference Property DLC1DawnguardGateRef1  Auto  
ObjectReference Property DLC1DawnguardGateRef2  Auto  
ObjectReference Property DLC1DawnguardGateRef3  Auto  
GlobalVariable Property DLC1RV10DoOnce  Auto   
Outfit Property DLC1FlorentiusOutfit  Auto  
Cell Property DLC1DawnguardHQ01 Auto  ; Added By TCGiSOLux Master Plugin Interior
Quest Property DLC1VQ01MiscObjective  Auto  ; Added By TCGiSOLux Master Plugin Interior
Faction Property DLC1HunterFaction  Auto  ; Added By TCGiSOLux Master Plugin Interior
Quest Property DLC1DialogueHunterBase  Auto  ; Added By TCGiSOLux Master Plugin Interior
Quest Property DLC1DialogueHunterVampireBlock  Auto  ; Added By TCGiSOLux Master Plugin Interior
Quest Property DawnguardAgents  Auto  ; Added By TCGiSOLux Master Plugin Interior