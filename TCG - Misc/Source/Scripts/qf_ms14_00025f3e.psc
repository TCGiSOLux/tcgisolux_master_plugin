;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 64
Scriptname QF_MS14_00025F3E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Alva
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alva Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hroggar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hroggar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlvasCoffin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlvasCoffin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gravedigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gravedigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Helgi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Helgi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GhorunnHall
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GhorunnHall Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HelgiCoffin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HelgiCoffin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CoffinDirt
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CoffinDirt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlRebel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlRebel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BurnedHouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BurnedHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlvasJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlvasJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thonnir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thonnir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossVampireMorvath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossVampireMorvath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Laelette
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Laelette Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlImperial
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jorgen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jorgen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lami
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lami Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lurbuk
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lurbuk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Benor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Benor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
;Fix Alva dushman emas, agar hiyla-nayranglar ishlatilgan bo'lsa.
if GetStageDone(95) == 0 || GetStageDone(100) == 0
Faction VampireFaction = Game.GetFormFromFile(0x00027242, "Skyrim.esm") as Faction
Faction TownMorthalFaction = Game.GetFormFromFile(0x0002817D, "Skyrim.esm") as Faction
Actor Alva = Alias_Alva.GetActorReference()

Alva.SetRelationshipRank(Alias_Lami.GetActorReference(), 0)
Alva.SetRelationshipRank(Alias_Hroggar.GetActorReference(), 0)
Alva.RemoveFromFaction(TownMorthalFaction)
Alva.RemoveFromFaction(CrimeFaction)
Alva.AddToFaction(VampireFaction)
Alva.SetCrimeFaction(None)
Alva.SetAV( "aggression", 2 )
endif

; Topshiriq tugadi, o'yinchi mukofot oldi
Alias_Hroggar.GetActorReference().SetActorValue("aggression", 1)
Alias_Hroggar.TryToStopCombat()
Alias_Hroggar.GetActorReference().StopCombatAlarm()
Alias_Hroggar.GetActorReference().SetCrimeFaction(CrimeFaction)
SetObjectiveCompleted(120, 1)
Game.GetPlayer().AddItem(Reward, 1)
AchievementsQuest.IncSideQuests()
UnregisterForUpdate()
If Alias_JarlImperial.GetActorReference().IsInFaction(JobJarlFaction) == True
     Alias_JarlImperial.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 2)
ElseIf  Alias_JarlRebel.GetActorReference().IsInFaction(JobJarlFaction) == True
     Alias_JarlRebel.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 2)
EndIf
Alias_BossVampireMorvath.TryToDisable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; O'yinchi Alvaning jurnalini faollashtirdi
Faction VampireFaction = Game.GetFormFromFile(0x00027242, "Skyrim.esm") as Faction
Faction TownMorthalFaction = Game.GetFormFromFile(0x0002817D, "Skyrim.esm") as Faction
SetObjectiveCompleted(70, 1)
SetObjectiveDisplayed(95, 1)
;Agar Alva tirik bo'lsa, u uyada, lekin dushman emas. Bu muammoni hal qiladi.
Actor Alva = Alias_Alva.GetActorReference()
Alva.RemoveFromFaction(TownMorthalFaction)
Alva.RemoveFromFaction(CrimeFaction)
Alva.AddToFaction(VampireFaction)
Alva.SetAV( "aggression", 2 )
Alias_Hroggar.GetActorReference().SetActorValue("aggression", 1)
Alva.SetRelationshipRank(Alias_Lami.GetActorReference(), 0)
Alva.SetRelationshipRank(Alias_Hroggar.GetActorReference(), 0)
Alias_Hroggar.TryToStopCombat()
Alias_Hroggar.GetActorReference().StopCombatAlarm()
Alias_Hroggar.GetActorReference().SetCrimeFaction(CrimeFaction)

if !( Alva.IsDead() )
  ;Alva ham xuddi shu kamerada bo'lishi mumkin.
  if !( Alva.Is3DLoaded() )
    Alva.MoveTo(Alias_BossVampireMorvath.GetReference())
  endif
endif

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
;Ish boshlash

RegisterForUpdate(5)
Alias_Alva.GetReference().RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; O'yinchi Tonnirning Laelettening eri ekanligini biladi.

Alias_Helgi.TryToDisable()

;SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(60, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
If Alias_Lurbuk.GetActorReference().IsDead() == 0
    Alias_Lurbuk.TryToMoveTo(LurbukGhoruunWait)
    Alias_Lurbuk.TryToEvaluatePackage()
EndIf
If Alias_Benor.GetActorReference().IsDead() == 0
    Alias_Benor.TryToMoveTo(BenorGhoruunWait)
    Alias_Benor.TryToEvaluatePackage()
EndIf
If Alias_Jorgen.GetActorReference().IsDead() == 0
    Alias_Jorgen.TryToMoveTo(JorgenGhoruunWait)
    Alias_Jorgen.TryToEvaluatePackage()
EndIf
If Alias_Lami.GetActorReference().IsDead() == 0
    Alias_Lami.TryToMoveTo(LamiGhoruunWait)
    Alias_Lami.TryToEvaluatePackage()
EndIf
If Alias_Thonnir.GetActorReference().IsDead() == 0
    Alias_Thonnir.TryToMoveTo(ThonnirGhoruunWait)
    Alias_Thonnir.TryToEvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
;O'yinchi Laeletteni o'ldirdi

ThonnirFindLaelette.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; Alva o'ldi
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; O'yinchi Movarthning uyasiga yetib keldi, NPClarni ko'chiring
; Bu bosqich asosan voqeani kuzatish uchun. U yangi maqsadlar qo'ymaydi
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
MobScared.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; O'yinchi Helgi bilan uchrashdi va u yashirinmachoq o'ynamoqda.

Alias_Helgi.TryToDisable()
Alias_CoffinDirt.TryToDisable()

Alias_Laelette.TryToEnable()
Alias_Laelette.GetActorReference().setGhost(true)
Alias_Laelette.GetActorReference().SetAlpha(0)

SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; O'yinchi Alvani tobutida ushladi
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; O'yinchi Jarldan topshiriqni oldi

Alias_Helgi.TryToEnable()

SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
Alias_Helgi.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; O'yinchi Laelette Alva bilan birga bo'lganini bilib oladi

SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(70, 1)
Alias_AlvasJournal.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; O'yinchi Movartning uyiga yuboriladi
Alias_Alva.GetReference().UnregisterForUpdate()
Faction VampireFaction = Game.GetFormFromFile(0x00027242, "Skyrim.esm") as Faction
Faction TownMorthalFaction = Game.GetFormFromFile(0x0002817D, "Skyrim.esm") as Faction
;Agar Alva tirik bo'lsa, u uyada, lekin dushman emas. Bu muammoni hal qiladi.
Actor Alva = Alias_Alva.GetActorReference()
Alva.RemoveFromFaction(TownMorthalFaction)
Alva.RemoveFromFaction(CrimeFaction)
Alva.AddToFaction(VampireFaction)
Alva.SetAV( "aggression", 2 )

Alva.SetRelationshipRank(Alias_Lami.GetActorReference(), 0)
Alva.SetRelationshipRank(Alias_Hroggar.GetActorReference(), 0)
Alias_Hroggar.GetActorReference().SetActorValue("aggression", 1)
Alias_Hroggar.TryToStopCombat()
Alias_Hroggar.GetActorReference().StopCombatAlarm()
Alias_Hroggar.GetActorReference().SetCrimeFaction(CrimeFaction)

if !(Alva.IsDead())
  Alva.MoveTo(Alias_BossVampireMorvath.GetReference())
endif

SetObjectiveCompleted(95, 1)
SetObjectiveDisplayed(100, 1)

If Alias_JarlImperial.GetActorReference().IsInFaction(JobJarlFaction) == True
     Alias_JarlImperial.GetActorReference().MakePlayerFriend()
ElseIf  Alias_JarlRebel.GetActorReference().IsInFaction(JobJarlFaction) == True
     Alias_JarlRebel.GetActorReference().MakePlayerFriend()
EndIf

; Alias_Thonnir.GetRef().RegisterForUpdate(1)
Game.GetPlayer().AddItem(FirstReward, 1)

If Alias_Lurbuk.GetActorReference().IsDead() == 0 && Alias_Lurbuk.GetActorReference().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Lurbuk.TryToMoveTo(LurbukWaitMarker)
    Alias_Lurbuk.TryToEvaluatePackage()
EndIf
If Alias_Benor.GetActorReference().IsDead() == 0 && Alias_Benor.GetActorReference().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Benor.TryToMoveTo(BenorWaitMarker)
    Alias_Benor.TryToEvaluatePackage()
EndIf
If Alias_Jorgen.GetActorReference().IsDead() == 0 && Alias_Jorgen.GetActorReference().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Jorgen.TryToMoveTo(JorgenWaitMarker)
    Alias_Jorgen.TryToEvaluatePackage()
EndIf
If Alias_Lami.GetActorReference().IsDead() == 0 && Alias_Lami.GetActorReference().IsInFaction(CurrentFollowerFaction) == 0
    Alias_Lami.TryToMoveTo(LamiWaitMarker)
    Alias_Lami.TryToEvaluatePackage()
EndIf
If Alias_Thonnir.GetActorReference().IsDead() == 0
    Alias_Thonnir.TryToMoveTo(ThonnirWaitMarker)
    Alias_Thonnir.TryToEvaluatePackage()
EndIf

Alias_BossVampireMorvath.TryToEnable()

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
; Alvaning kundaligisiz ham vampir ekanligini isbotlashga harakat qildi.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; O'yinchi Helgining tobuti bilan gaplashdi

SetObjectiveCompleted(40, 1)
SetObjectiveDisplayed(60, 1)
SetObjectiveDisplayed(35, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
SetObjectiveDisplayed(35, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
; O'yinchi yonib ketgan uyga yaqinlashdi

Alias_BurnedHouse.GetReference().UnregisterForUpdate()
GhoruunCell.Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
; Movart o'ldi

SetObjectiveCompleted(100, 1)
SetObjectiveDisplayed(120, 1)

Alias_Helgi.TryToEnable()
Alias_Helgi.TryToMoveTo(MS14HelgiThankYouMarker)
Alias_Thonnir.GetActorReference().MakePlayerFriend()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
; o'yinchi Highmoon Hall tashqarisida olomonni tark etmoqda

kmyQuest.MobMarch = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE MS14
Quest __temp = self as Quest
MS14 kmyQuest = __temp as MS14
;END AUTOCAST
;BEGIN CODE
; O'yinchi Bern haqida mish-mishlar eshitgan va unga boshqaruvchini ko'rish buyurilgan

If GetStage() <= 20
    SetObjectiveDisplayed(20, 1)
EndIf

kmyQuest.StopHouseRumor = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ObjectReference Property JorgenWaitMarker auto
ObjectReference Property BenorWaitMarker auto
ObjectReference Property LamiWaitMarker auto
ObjectReference Property LurbukWaitMarker auto
ObjectReference Property ThonnirWaitMarker auto
ObjectReference Property JorgenGhoruunWait auto
ObjectReference Property BenorGhoruunWait auto
ObjectReference Property LamiGhoruunWait auto
ObjectReference Property LurbukGhoruunWait auto
ObjectReference Property ThonnirGhoruunWait auto
Scene Property MobScared  Auto  
Scene Property ThonnirFindLaelette  Auto  
ObjectReference Property MS14HelgiThankYouMarker  Auto  
Cell Property GhoruunCell  Auto  
Faction Property JobJarlFaction  Auto  
LeveledItem Property Reward  Auto  
LeveledItem Property FirstReward  Auto  
Faction Property CrimeFaction  Auto  
AchievementsScript Property AchievementsQuest Auto
Faction Property CurrentFollowerFaction  Auto  