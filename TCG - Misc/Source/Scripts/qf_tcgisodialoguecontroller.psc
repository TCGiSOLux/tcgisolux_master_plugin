;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname qf_tcgisodialoguecontroller Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Battle starts against Stalf and Salonia Caelia
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Xal'atath presents

; initialize TCGiSO Mod

; NPCs no longer hate to evil vampires, if Dawnguard DLC are initialized
if !Game.GetPlayer().IsInFaction(DLC1PlayerVampireLordFaction) && Game.GetPlayer().IsInFaction(VampirePCFaction)
Game.GetPlayer().RemoveFromFaction(VampirePCFaction)
Game.GetPlayer().SetAttackActorOnSight(false)

int cfIndex = 0
if (cfIndex < WerewolfHateFactions.GetSize())
(WerewolfHateFactions.GetAt(cfIndex) as Faction).SetPlayerEnemy(false)
cfIndex += 1
endif

endif

;add formlist to crime factions

;Vanilla Game
CrimeFactionsList.Addform(CompanionsFaction)
CrimeFactionsList.Addform(CrimeFactionThievesGuild)
;Dawnguard DLC
CrimeFactionsList.Addform(DLC1SeranaCrimeFaction)
CrimeFactionsList.Addform(DLC1DawnguardCrimeFaction)
CrimeFactionsList.Addform(DLC1VampireCrimeFaction)
;Dragonborn DLC
CrimeFactionsList.Addform(DLC2dunFrostmoonWerewolvesFaction)
CrimeFactionsList.Addform(DLC2SkaalVillageCitizenFaction)
CrimeFactionsList.Addform(DLC2ThirskNordCrimeFaction)

;add formlist to Werewolf Hate
;Vanilla Game
WerewolfHateFactions.AddForm(VampireFaction)
WerewolfHateFactions.AddForm(CrimeFactionThievesGuild)
;Dawnguard DLC
WerewolfHateFactions.AddForm(DLC1ValericaFaction)
WerewolfHateFactions.AddForm(DLC1SeranaFaction)
WerewolfHateFactions.AddForm(DLC1DawnguardCrimeFaction)

;add formlist to Vampire Hate

;Vanilla Game
DLC1VampireHateFactions.AddForm(CrimeFactionThievesGuild)

;Dawnguard DLC
DLC1VampireHateFactions.AddForm(DLC1DawnguardCrimeFaction)

;Set allies/friend to factions

;Vanilla (Base Game)
TownRiftenFaction.SetAlly(RiftenSkoomaDealerFactionFriend, true, true)
dunMarkarthWizard_SecureAreaFaction.SetAlly(dunMarkarthWizard_SecureAreaFaction)
dunMarkarthWizard_SecureAreaFaction.SetAlly(GuardDialogueFaction)
GuardFactionCidhnaMine.SetAlly(GuardDialogueFaction)
GuardFactionMarkarth.SetAlly(GuardDialogueFaction)
VampireFaction.SetAlly(TownHalfMoonMillFaction)
VampireFaction.SetAlly(HalfMoonMillFaction)
VampireFaction.SetAlly(RiftenSkoomaDealerFactionFriend, true, true)

;Dawnguard DLC
DLC1VampireFaction.SetAlly(RiftenSkoomaDealerFactionFriend, true, true)
DLC1HunterDisguisedFaction.SetAlly(DLC1HunterFaction)
DLC1HunterFaction.SetAlly(VigilantOfStendarrFaction)
DLC1HunterFaction.SetEnemy(VampireFaction)
DLC1VampireFaction.SetAlly(TownHalfMoonMillFaction)
DLC1VampireFaction.SetAlly(HalfMoonMillFaction)
DLC1VampireFaction.SetAlly(DLC1VampireFaction)
CompanionsFaction.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
CrimeFactionEastmarch.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
CrimeFactionFalkreath.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
CrimeFactionHaafingar.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
CrimeFactionHjaalmarch.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
CrimeFactionPale.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
CrimeFactionReach.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
CrimeFactionRift.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
CrimeFactionWhiterun.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
CrimeFactionWinterhold.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
IsGuardFaction.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
ThievesGuildFaction.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
DLC1VampireFaction.SetAlly(DLC1DefendersByDawnguardAttacksFaction)
DLC1RV07CoffinOwnerFaction.SetAlly(DLC1RV07CoffinOwnerFaction)

;Set enemy/neutral to factions

;Vanilla (Base Game)
if dunAlftandQST.GetStage() < 89
DunAlftandSullaHostileFaction.SetEnemy(PlayerFaction, true, true)
DunAlftandUmanaHostileFaction.SetEnemy(PlayerFaction, true, true)
endif

DragonFaction.SetEnemy(SilverHandFaction)
DragonFaction.SetEnemy(playerfaction)
DragonFaction.SetEnemy(banditfaction)
DragonFaction.SetEnemy(vampirefaction)
DragonFaction.SetEnemy(dragurfaction)
DragonFaction.SetEnemy(WarlockFaction)
DragonFaction.SetEnemy(NecromancerFaction)
DragonFaction.SetEnemy(ThalmorFaction)

DA06YamarzCombatFaction.setenemy(playerfaction)
DA14CultistFaction.setenemy(playerfaction)
MS06PotemaFaction.setenemy(playerfaction)
MS06CultistFaction.setenemy(playerfaction)
MS06CultistSceneFaction.setenemy(playerfaction)
DunAnsilvundBanditFaction.setenemy(playerfaction)
DunAnsilvundDraugrFaction.setenemy(playerfaction)
dunHonningbrewMeaderyCreatureFaction.setenemy(playerfaction)
DA01PlayerEnemyFaction.setenemy(playerfaction)
DBPenitusOculatusFaction.setenemy(playerfaction)
MQAncientHeroFaction.setenemy(MQ304AlduinFaction)
MQ304AlduinFaction.setenemy(playerfaction)
MS03ChaletGuardEnemyFaction.setenemy(playerfaction)
MQ202EnemyofPlayerFaction.setenemy(playerfaction)
dunYngvildFaction.setenemy(playerfaction)
CWSoldierPlayerEnemyFaction.setenemy(playerfaction)
dunMistwatchFjolaFaction.setenemy(playerfaction, true, true)
dunHarmugstahlFactionWarlock.setenemy(playerfaction)
dunHarmugstahlFactionWarlockAttackedbySpiders.setenemy(playerfaction)
dunHarmugstahlFactionSpiderNormal.setenemy(playerfaction)
dunHarmugstahlFactionSpiderDocile.setenemy(playerfaction, true, true)
dunFaldarsToothDogAttackFaction.setenemy(banditfaction, true, true)
dunFaldarsToothDogAttackFaction.setenemy(playerfaction, true, true)
dunSkuldafnDragonFaction.SetEnemy(playerfaction)
dunBluePalaceFaction.SetEnemy(PlayerFaction, true, true)
dunBluePalacePelagiusArenaFaction.SetEnemy(PlayerFaction, true, true)
DA16PriestFaction.SetEnemy(PlayerFaction, true, true)
DA16PriestFaction.SetEnemy(DA16VaerminaDreamFaction, true, true)
DA16PriestFaction.SetEnemy(DA16OrcDreamFaction, true, true)
WEAggressiveAdventurerFaction.SetEnemy(PlayerFaction)
dunMarkarthWizard_SpiderFaction.SetEnemy(dunMarkarthWizard_SecureAreaFaction)
dunMarkarthWizard_SpiderFaction.SetEnemy(MarkarthKeepFaction)
dunMarkarthWizard_SpiderFaction.SetEnemy(MarkarthWizardFaction)
MS09NorthwatchPrisonerFaction.SetEnemy(PlayerFaction, true, true)
MS09NorthwatchPrisonerFaction.SetEnemy(MS09PlayerAllyFaction, true, true)
MS09NorthwatchPrisonerFaction.SetEnemy(MS09NorthwatchFaction)
DBAttackPlayerFaction.SetEnemy(PlayerFaction)
dunKilkreathFaction.SetEnemy(PlayerFaction)
MS02GrisvarEnemyFaction.SetEnemy(PlayerFaction)
MS02ForswornFaction.SetEnemy(GuardDialogueFaction)
SilverHandFaction.SetEnemy(CompanionsFaction)
SilverHandFaction.SetEnemy(PlayerFaction)
BanditFaction.SetEnemy(CaravanALeader, true, true)
BanditFaction.SetEnemy(KhajiitCaravanFaction, true, true)
CWImperialFactionNPC.SetEnemy(GovImperial, true, true)
CWSonsFactionNPC.SetEnemy(GovSons, true, true)
RiftenSkoomaDealerFactionEnemy.SetEnemy(VampireFaction)
RiftenSkoomaDealerFactionEnemy.SetEnemy(TownRiftenFaction)
CrimeFactionHaafingar.SetEnemy(VampirePCFaction)

;Dawnguard DLC
RiftenSkoomaDealerFactionEnemy.SetEnemy(DLC1VampireFaction)
DLC1WEEnemyFaction.SetEnemy(PlayerFaction)
DLC1WEEnemyFaction.SetEnemy(VampireFaction)
DLC1WEEnemyFaction.SetEnemy(DLC1VampireFaction)
DLC1DawnguardCrimeFaction.SetEnemy(WerewolfFaction)
DLC1DawnguardCrimeFaction.SetEnemy(VampirePCFaction)
DLC1DawnguardCrimeFaction.SetEnemy(DLC1PlayerVampireLordFaction)
DLC1VampireFaction.SetEnemy(VigilantOfStendarrFaction)
CompanionsFaction.SetEnemy(DLC1DawnguardAttackersFaction)
CrimeFactionEastmarch.SetEnemy(DLC1DawnguardAttackersFaction)
CrimeFactionFalkreath.SetEnemy(DLC1DawnguardAttackersFaction)
CrimeFactionHaafingar.SetEnemy(DLC1DawnguardAttackersFaction)
CrimeFactionHjaalmarch.SetEnemy(DLC1DawnguardAttackersFaction)
CrimeFactionPale.SetEnemy(DLC1DawnguardAttackersFaction)
CrimeFactionReach.SetEnemy(DLC1DawnguardAttackersFaction)
CrimeFactionRift.SetEnemy(DLC1DawnguardAttackersFaction)
CrimeFactionWhiterun.SetEnemy(DLC1DawnguardAttackersFaction)
CrimeFactionWinterhold.SetEnemy(DLC1DawnguardAttackersFaction)
IsGuardFaction.SetEnemy(DLC1DawnguardAttackersFaction)
ThievesGuildFaction.SetEnemy(DLC1DawnguardAttackersFaction)
DLC1VampireFaction.SetEnemy(DLC1DawnguardAttackersFaction)
CrimeFactionEastmarch.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionFalkreath.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionHaafingar.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionHjaalmarch.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionPale.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionReach.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionRift.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionWhiterun.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionWinterhold.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionOrcs.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionImperial.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
CrimeFactionSons.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
DLC2CrimeRavenRockFaction.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
DLC2SkaalVillageCitizenFaction.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
DLC2ThirskNordCrimeFaction.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
DLC1VampireFaction.SetEnemy(DLC1DawnguardEscapedCriminalFaction)
DLC1VampireIntroEnemyFaction.SetEnemy(DLC1VampireIntroEnemyFaction, true, true)

;Dragonborn DLC
DLC2CrimeRavenRockFaction.SetEnemy(WerewolfFaction)
DLC2SkaalVillageCitizenFaction.SetEnemy(WerewolfFaction)
DLC2SkaalVillageCitizenFaction.SetEnemy(VampirePCFaction)
DLC2CrimeRavenRockFaction.SetEnemy(VampirePCFaction)
DLC2ThirskNordCrimeFaction.SetEnemy(VampirePCFaction)
DLC2CrimeRavenRockFaction.SetEnemy(DLC1PlayerVampireLordFaction)
DLC2SkaalVillageCitizenFaction.SetEnemy(DLC1PlayerVampireLordFaction)
DLC2ThirskNordCrimeFaction.SetEnemy(DLC1PlayerVampireLordFaction)
DLC2_WESC01VampireFaction.SetEnemy(DLC2CrimeRavenRockFaction)
DLC2_WESC01VampireFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;player has spoken to Garan Marethi
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;Vanilla Game
Faction Property DA06YamarzCombatFaction Auto
Faction Property DA14CultistFaction Auto
Faction Property MS06PotemaFaction Auto
Faction Property MS06CultistFaction Auto
Faction Property MS06CultistSceneFaction Auto
Faction Property DunAnsilvundBanditFaction Auto
Faction Property DunAnsilvundDraugrFaction Auto
Faction Property dunHonningbrewMeaderyCreatureFaction Auto
Faction Property DA01PlayerEnemyFaction Auto
Faction Property DBPenitusOculatusFaction Auto
Faction Property MQAncientHeroFaction Auto 
Faction Property MQ304AlduinFaction Auto
Faction Property MS03ChaletGuardEnemyFaction Auto
Faction Property MQ202EnemyofPlayerFaction Auto
Faction Property dunYngvildFaction Auto
Faction Property CWSoldierPlayerEnemyFaction Auto 
Faction Property dunMistwatchFjolaFaction Auto 
Faction Property dunHarmugstahlFactionWarlock Auto 
Faction Property dunMarkarthWizard_SpiderFaction Auto 
Faction Property dunHarmugstahlFactionSpiderNormal Auto
Faction Property dunHarmugstahlFactionWarlockAttackedbySpiders Auto 
Faction Property dunHarmugstahlFactionSpiderDocile Auto 
Faction Property dunForelhostGrifterUnfriendly Auto 
Faction Property dunFaldarsToothDogAttackFaction Auto 
Faction Property dunSkuldafnDragonFaction Auto 
Faction Property dunBluePalaceFaction Auto 
Faction Property dunKilkreathFaction Auto 
Faction Property dunBluePalacePelagiusArenaFaction Auto 
Faction Property DA16VaerminaDreamFaction Auto 
Faction Property DA16PriestFaction Auto 
Faction Property DA16OrcDreamFaction Auto 
Faction Property WEAggressiveAdventurerFaction Auto 
Faction Property MS09PlayerAllyFaction Auto 
Faction Property MS09NorthwatchFaction Auto 
Faction Property MS09NorthwatchPrisonerFaction Auto 
Faction Property MarkarthKeepFaction Auto 
Faction Property MarkarthWizardFaction Auto 
Faction Property DBAttackPlayerFaction Auto 
Faction Property DunAlftandSullaHostileFaction Auto 
Faction Property DunAlftandUmanaHostileFaction Auto 
Faction Property MS02GrisvarEnemyFaction Auto  
Faction Property PlayerFaction Auto  
Faction Property WerewolfFaction Auto  
Faction Property VampirePCFaction Auto  
Faction Property ThievesGuildFaction Auto  
Faction Property BanditFaction Auto  
Faction Property SprigganFaction Auto  
Faction Property DragonFaction Auto  
Faction Property CrimeFactionThievesGuild Auto  
Faction Property MS02ForswornFaction Auto  
Faction Property CrimeFactionEastmarch Auto  
Faction Property CrimeFactionFalkreath Auto  
Faction Property CrimeFactionHaafingar Auto  
Faction Property CrimeFactionHjaalmarch Auto  
Faction Property CrimeFactionPale Auto  
Faction Property CrimeFactionReach Auto  
Faction Property CrimeFactionRift Auto  
Faction Property CrimeFactionWhiterun Auto  
Faction Property CrimeFactionWinterhold Auto  
Faction Property CrimeFactionOrcs Auto  
Faction Property CrimeFactionImperial Auto  
Faction Property CrimeFactionSons Auto  
Faction Property dunMarkarthWizard_SecureAreaFaction Auto  
Faction Property GuardFactionCidhnaMine Auto  
Faction Property GuardFactionMarkarth Auto  
Faction Property GuardDialogueFaction Auto  
Faction Property SilverHandFaction Auto  
Faction Property CompanionsFaction Auto  
Faction Property TownHalfMoonMillFaction Auto
Faction Property HalfMoonMillFaction Auto
Faction Property VigilantOfStendarrFaction Auto
Faction Property CaravanALeader Auto
Faction Property KhajiitCaravanFaction Auto
Faction Property CWImperialFactionNPC Auto
Faction Property CWSonsFactionNPC Auto
Faction Property GovImperial Auto
Faction Property GovSons Auto
Faction Property VampireFaction Auto
Faction Property TownRiftenFaction Auto
Faction Property RiftenSkoomaDealerFactionFriend Auto
Faction Property RiftenSkoomaDealerFactionEnemy Auto
Faction Property DragurFaction Auto
Faction Property WarlockFaction Auto
Faction Property NecromancerFaction Auto
Faction Property ThalmorFaction Auto
Faction Property ForswornFaction Auto
Faction Property GiantFaction Auto
Faction Property CaravanGuard Auto
Faction Property IsGuardFaction Auto
Faction Property BladesRecruitsFaction Auto
Formlist Property WerewolfHateFactions Auto  
Formlist Property CrimeFactionsList Auto  
Actor Property AlvaREF Auto  
Actor Property HroggarREF Auto  
Actor Property LamiREF Auto  
Quest Property dunAlftandQST Auto  

;Dawnguard DLC
Faction Property DLC1WEEnemyFaction Auto
Faction Property DLC1HunterFaction Auto
Faction Property DLC1VampireFaction Auto
Faction Property DLC1VampireIntroEnemyFaction Auto
Faction Property DLC1HunterDisguisedFaction Auto
Faction Property DLC1ValericaFaction Auto  
Faction Property DLC1SeranaCrimeFaction Auto  
Faction Property DLC1SeranaFaction Auto  
Faction Property DLC1DefendersByDawnguardAttacksFaction Auto  
Faction Property DLC1DawnguardEscapedCriminalFaction Auto  
Faction Property DLC1RV07CoffinOwnerFaction Auto  
Faction Property DLC1PlayerVampireLordFaction Auto  
Faction Property DLC1DawnguardAttackersFaction Auto  
Faction Property DLC1VampireCrimeFaction Auto  
Faction Property DLC1DawnguardCrimeFaction Auto  
Formlist Property DLC1VampireHateFactions Auto  

;Dragonborn DLC
Faction Property DLC2_WESC01VampireFaction Auto  
Faction Property DLC2dunFrostmoonWerewolvesFaction Auto  
Faction Property DLC2CrimeRavenRockFaction Auto  
Faction Property DLC2SkaalVillageCitizenFaction Auto  
Faction Property DLC2ThirskNordCrimeFaction Auto  
