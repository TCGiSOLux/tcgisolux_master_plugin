;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate15 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update
Utility.Wait(8)

VoicesFollowerAll.AddForm(DLC1FemaleUniqueFura)
VoicesFollowerAll.AddForm(DLC1FemaleVampire)
VoicesMarriageAll.AddForm(DLC1FemaleUniqueFura)
VoicesMarriageAll.AddForm(DLC1FemaleVampire)
VoicesMarriageAdoptionAll.AddForm(DLC1FemaleUniqueFura)
VoicesMarriageAdoptionAll.AddForm(DLC1FemaleVampire)

VoicesFollowerNeutral.RemoveAddedForm(DLC1FemaleVampire)
VoicesFollowerRough.AddForm(DLC1FemaleVampire)

VoicesMarriageAdoptionArrogant.AddForm(DLC1FemaleUniqueFura)
VoicesMarriageAdoptionRough.AddForm(DLC1FemaleVampire)
VoicesMarriageArrogant.AddForm(DLC1FemaleUniqueFura)
VoicesMarriageRough.AddForm(DLC1FemaleVampire)

Utility.Wait(3)

if DLC1VampireBaseIntro.GetStage() >= 200
DLC1VampireIntroEnemyFaction.SetEnemy(PlayerFaction, true, true)
endif

CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT  

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
FormList Property VoicesFollowerAll auto
FormList Property VoicesFollowerNeutral auto
FormList Property VoicesFollowerRough auto
FormList Property VoicesMarriageAll auto
FormList Property VoicesMarriageArrogant auto
FormList Property VoicesMarriageRough auto
FormList Property VoicesMarriageAdoptionAll auto
FormList Property VoicesMarriageAdoptionArrogant auto
FormList Property VoicesMarriageAdoptionRough auto
Quest Property DLC1VampireBaseIntro  Auto  
Faction Property DLC1VampireIntroEnemyFaction  Auto  
Faction Property PlayerFaction  Auto  
VoiceType Property DLC1FemaleVampire  Auto  
VoiceType Property DLC1FemaleUniqueFura  Auto  