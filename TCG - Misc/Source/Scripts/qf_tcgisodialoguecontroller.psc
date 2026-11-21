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
debug.trace(self + " TCGiSO INIT quest START")

; NPCs no longer hate to evil vampires, if Dawnguard DLC are initialized
if !Game.GetPlayer().IsInFaction(DLC1PlayerVampireLordFaction) && Game.GetPlayer().IsInFaction(VampirePCFaction)
Game.GetPlayer().RemoveFromFaction(VampirePCFaction)
Game.GetPlayer().SetAttackActorOnSight(false)

int cfIndex = 0
if (cfIndex < WerewolfHateFactions.GetSize()) && !Game.GetPlayer().IsInFaction(DLC1PlayerVampireLordFaction) && !Game.GetPlayer().IsInFaction(VampirePCFaction)
(WerewolfHateFactions.GetAt(cfIndex) as Faction).SetPlayerEnemy(false)
cfIndex += 1
endif

endif

; add messages
HelpManualPC.addform(HelpLegendary)
HelpManualXbox.addform(HelpLegendary)

;quest update/fix

If DA01.GetStageDone(100) && DA01Fin.GetStageDone(10)
DA01Fin.SetStage(0)
endif

If DLC1RV10.GetStageDone(255)
  DLC1DawnguardHQ01.SetFactionOwner(DLC1HunterFaction)
  DLC1DawnguardHQ01.SetPublic(false)
  DialogueHunterBase.Stop()
  DialogueHunterVampireBlock.Stop()
  DawnguardAgents.Stop()
  VampireAgents.Stop()
Endif

if DLC1VQ08.GetStageDone(60) && !DLC1PlayingVampireLine.GetValue()
DialogueVampireBase.Stop()
DialogueVampireCuredBlock.Stop()
Endif

If !SolitudeOpening.GetStageDone(30) && SolitudeOpening.GetStageDone(200)
  RoggvirREF.SetActorValue( "aggression", 1 )
  RoggvirREF.RemoveFromFaction(CrimeFactionHaafingar)
  RoggvirREF.SetCrimeFaction(None)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionHaafingar)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireCrimeFaction)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireFaction)
Endif

If SolitudeOpening.GetStageDone(200) && SolitudeOpening.GetStageDone(30)
  RoggvirREF.SetActorValue( "aggression", 1 )
  RoggvirREF.RemoveFromFaction(CrimeFactionHaafingar)
  RoggvirREF.SetCrimeFaction(None)
  SolitudeOpeningPrisonerFaction.SetEnemy(CrimeFactionHaafingar)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireCrimeFaction)
  SolitudeOpeningPrisonerFaction.SetEnemy(DLC1VampireFaction)
Endif

If T01.GetStageDone(200) && T01.IsRunning()
LailatheUnbrokenREF.MakePlayerFriend()
CamillaLeotelliREF.MakePlayerFriend()
T01.stop()
Endif

If DLC1VQ01MiscObjective.GetStageDone(200) && DLC1VQ01MiscObjective.GetStageDone(250) && DLC1RV10.GetStageDone(10)
  DLC1VQ01MiscObjective.setStage(250)
Endif

If !DLC1VQ01MiscObjective.GetStageDone(250) && DLC1RV10.GetStageDone(10)
  DLC1VQ01MiscObjective.setStage(250)
Endif

If T02.GetStageDone(70) && TG06.GetStageDone(25) && dmWQQST.GetStageDone(1) && !FreeformMarkarthO.GetStageDone(20) && !DialogueMarkarth.GetStageDone(120)
  DialogueMarkarth.SetStage(120)
Endif

If DLC1RV10.GetStageDone(10) && !DLC1RV10.GetStageDone(100) && DLC1RV10DoOnce.GetValue()
  DLC1DawnguardHQ01.SetPublic(true)
Endif

If DLC1RV10.GetStageDone(100) && DLC1RV10.GetStageDone(255)
  DLC1DawnguardHQ01.SetPublic(false)
Endif

;setup npcs
GabriellaREF.SetCrimeFaction(Game.GetFormFromFile(0x0001BDB3, "Skyrim.esm") as Faction)

if ShipsNorthwindVoldseaREF.IsInFaction(CrimeFactionWinterhold) && !ShipsNorthwindVoldseaREF.IsInFaction(DLC1VampireCrimeFaction)
   ShipsNorthwindVoldseaREF.RemoveFromFaction(CrimeFactionWinterhold)
   ShipsNorthwindVoldseaREF.AddToFaction(CrimeFactionEastmarch)
   ShipsNorthwindVoldseaREF.SetCrimeFaction(CrimeFactionEastmarch)
endif

if ShipNorthwindDalanREF.IsInFaction(CrimeFactionWinterhold)
   ShipNorthwindDalanREF.RemoveFromFaction(CrimeFactionWinterhold)
   ShipNorthwindDalanREF.AddToFaction(CrimeFactionEastmarch)
   ShipNorthwindDalanREF.SetCrimeFaction(CrimeFactionEastmarch)
endif

if ShipsWindhelmKjarREF.IsInFaction(CrimeFactionWinterhold)
   ShipsWindhelmKjarREF.RemoveFromFaction(CrimeFactionWinterhold)
   ShipsWindhelmKjarREF.AddToFaction(CrimeFactionEastmarch)
   ShipsWindhelmKjarREF.SetCrimeFaction(CrimeFactionEastmarch)
endif

;cell setup

If !DLC1HarkonDead.GetValue() && !DLC1PlayingVampireLine.GetValue()
DLC1VampireCastleGuildhall.SetFactionOwner(DLC1VampireFaction)
Endif

SolitudeErikursHouse.SetFactionOwner(SolitudeErikursHouseFaction)
HollyfrostFarm.SetFactionOwner(HollyFrostFarmFaction)
BrandyMugFarm.SetFactionOwner(BrandyMugFarmFaction)
HlaaluFarm.SetFactionOwner(HlaaluFarmFaction)
SolitudeVittoriaVicisHouse.SetFactionOwner(SolitudeVittoriaVicciHouseFaction)
DLC1DawnguardHQ01.SetFactionOwner(DLC1HunterFaction)
RiftenMariseAravelsHouse.SetFactionOwner(RiftenMariseFaction)
BattleBornFarm.SetFactionOwner(WhiterunHouseBattleBornFaction)
MarkarthHalloftheDead.SetFactionOwner(MarkarthHallofDeadFaction)

;add formlist to crime factions

;Vanilla Game
CrimeFactionsList.Addform(DA11CannibalFaction)
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

;add locklist
;vanilla game
RiftenMeaderyLockList.addform(Jensine)
RiftenMeaderyLockList.addform(DareneLimax)
RiftenFisheryLockList.addform(DareneLimax)

;Dawnguard DLC
RiftenFisheryLockList.addform(DLC1BedyrickBuckingford)
RiftenFisheryLockList.addform(DLC1BarbaraBuckingford)

;add formlist voices
;Vanilla Game
VoicesJarl.AddForm(MaleNordCommander)
VoicesFollowerAll.AddForm(FemaleNord)
VoicesFollowerAll.AddForm(FemaleCommoner)
VoicesFollowerAll.AddForm(FemaleCoward)
VoicesFollowerAll.AddForm(FemaleElfHaughty)
VoicesFollowerAll.AddForm(FemaleShrill)
VoicesFollowerAll.AddForm(MaleCommander)
VoicesFollowerAll.AddForm(MaleElfHaughty)
VoicesFollowerAll.AddForm(FemaleUniqueVex)
VoicesFollowerAll.AddForm(FemaleUniqueKarliah)
VoicesFollowerAll.AddForm(FemaleUniqueMaven)
VoicesFollowerAll.AddForm(FemaleUniqueElenwen)

VoicesFollowerNeutral.AddForm(FemaleNord)
VoicesFollowerNeutral.AddForm(FemaleCommoner)
VoicesFollowerNeutral.AddForm(FemaleCoward)
VoicesFollowerNeutral.AddForm(FemaleElfHaughty)
VoicesFollowerNeutral.AddForm(FemaleShrill)
VoicesFollowerNeutral.AddForm(MaleCommander)
VoicesFollowerNeutral.AddForm(MaleElfHaughty)
VoicesFollowerNeutral.AddForm(FemaleUniqueVex)
VoicesFollowerNeutral.AddForm(FemaleUniqueKarliah)
VoicesFollowerNeutral.AddForm(FemaleUniqueMaven)
VoicesFollowerNeutral.AddForm(FemaleUniqueElenwen)

;Dawnguard DLC
DefaultNPCVoiceTypes.AddForm(DLC1MaleVampire)
DefaultNPCVoiceTypes.AddForm(DLC1FemaleVampire)
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
DLC1VoicesNonUnique.AddForm(DLC1MaleVampire)

;Hearthfire DLC
BYOHVoicesNonUnique.AddForm(DLC1MaleVampire)
BYOHVoicesNonUnique.AddForm(DLC1FemaleVampire)

;Dragonborn DLC
DLC2VoicesNonUnique.AddForm(DLC1MaleVampire)
DLC2VoicesNonUnique.AddForm(DLC1FemaleVampire)
DLC2VoiceTypesNonUniquePlusFrea.AddForm(DLC1MaleVampire)
DLC2VoiceTypesNonUniquePlusFrea.AddForm(DLC1FemaleVampire)
DLC2VoiceTypesNonUniquePlusRiekling.AddForm(DLC1MaleVampire)
DLC2VoiceTypesNonUniquePlusRiekling.AddForm(DLC1FemaleVampire)

;add formlist to Vampire Hate

;Vanilla Game
;	DLC1VampireHateFactions.AddForm(CrimeFactionThievesGuild)

;Dawnguard DLC
DLC1VampireHateFactions.AddForm(DLC1DawnguardCrimeFaction)

;Set allies/friend to factions

;Vanilla (Base Game)
TownHalfMoonMillFaction.SetAlly(FemaleVampiresFaction)
HalfMoonMillFaction.SetAlly(FemaleVampiresFaction)
MolagBalsVampiresFaction.SetAlly(DA10VampireFaction)
MolagBalsVampiresFaction.SetAlly(VampireFaction, true, true)
DA10VampireFaction.SetAlly(VampireFaction)
TownRiftenFaction.SetAlly(RiftenSkoomaDealerFactionFriend, true, true)
dunMarkarthWizard_SecureAreaFaction.SetAlly(dunMarkarthWizard_SecureAreaFaction)
dunMarkarthWizard_SecureAreaFaction.SetAlly(GuardDialogueFaction)
GuardFactionCidhnaMine.SetAlly(GuardDialogueFaction)
GuardFactionMarkarth.SetAlly(GuardDialogueFaction)
VampireFaction.SetAlly(TownHalfMoonMillFaction)
VampireFaction.SetAlly(HalfMoonMillFaction)
VampireFaction.SetAlly(RiftenSkoomaDealerFactionFriend, true, true)
HircineFightersFaction.SetAlly(HunterFaction, true, true)
VampireFriendFaction.SetAlly(FemaleVampiresFaction, true, true)
DA10VampireFaction.SetAlly(VampireThrallFaction, true, true)

;Dawnguard DLC
DLC1RadiantVampireBanditNecroAllys.SetAlly(ForswornFaction)
DLC1RadiantHunterBanditNecroVampAllys.SetAlly(ForswornFaction)
DLC1DawnguardPatrolFaction.SetAlly(DLC1HunterFaction)
DLC1DawnguardPatrolFaction.SetAlly(DLC1HunterAgentsFaction)
DLC1DawnguardPatrolFaction.SetAlly(VigilantOfStendarrFaction)
DLC1VampirePatrolFaction.SetAlly(FemaleVampiresFaction)
DLC1VampirePatrolFaction.SetAlly(VampireFaction)
DLC1VampirePatrolFaction.SetAlly(DLC1VampireFaction)
DLC1VampirePatrolFaction.SetAlly(DLC1VampireAgentsFaction)
DLC1VampirePatrolFaction.SetAlly(DLC1PlayerVampireLordFaction)
DLC1VampirePatrolFaction.SetAlly(DLC1VolkiharExteriorGuardFaction)
MolagBalsVampiresFaction.SetAlly(DLC1VampireFaction, true, true)
MolagBalsVampiresFaction.SetAlly(DLC1VampireAgentsFaction, true, true)
HircineFightersFaction.SetAlly(DLC1HunterFaction, true, true)
HircineFightersFaction.SetAlly(DLC1HunterAgentsFaction, true, true)
DLC1VampireFaction.SetAlly(RiftenSkoomaDealerFactionFriend, true, true)
DLC1HunterDisguisedFaction.SetAlly(DLC1HunterFaction)
DLC1HunterFaction.SetAlly(VigilantOfStendarrFaction)
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

;Dragonborn DLC
HircineFightersFaction.SetAlly(DLC2HunterFaction, true, true)
MolagBalsVampiresFaction.SetAlly(DLC2VampireFaction, true, true)

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
MolagBalsVampiresFaction.SetEnemy(CompanionsFaction)
MolagBalsVampiresFaction.SetEnemy(HunterFaction)
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
CWImperialFactionNPC.SetEnemy(dragonfaction)
CWSonsFactionNPC.SetEnemy(dragonfaction)
HircineFightersFaction.SetEnemy(VampireFaction)

;Dawnguard DLC
HunterFaction.SetEnemy(DLC1PlayerVampireLordFaction)
DLC1DawnguardPatrolFaction.SetEnemy(SilverHandFaction)
DLC1DawnguardPatrolFaction.SetEnemy(Game.GetFormFromFile(0x0002929A, "Dragonborn.esm") as Faction)
DLC1DawnguardPatrolFaction.SetEnemy(WEPlayerEnemy)
DLC1DawnguardPatrolFaction.SetEnemy(BanditFaction)
DLC1DawnguardPatrolFaction.SetEnemy(PredatorFaction)
DLC1DawnguardPatrolFaction.SetEnemy(DragonFaction)
DLC1DawnguardPatrolFaction.SetEnemy(WerewolfFaction)
DLC1DawnguardPatrolFaction.SetEnemy(DA13AfflictedFaction)
DLC1DawnguardPatrolFaction.SetEnemy(WIThugFaction)
DLC1DawnguardPatrolFaction.SetEnemy(DLC1_WESC09Faction)
DLC1DawnguardPatrolFaction.SetEnemy(DLC2CultistFaction)
DLC1DawnguardPatrolFaction.SetEnemy(DLC1VampireFaction)
DLC1DawnguardPatrolFaction.SetEnemy(DLC1VampireAgentsFaction)
DLC1DawnguardPatrolFaction.SetEnemy(DLC1PlayerVampireLordFaction)
DLC1DawnguardPatrolFaction.SetEnemy(VampireFaction)
DLC1DawnguardPatrolFaction.SetEnemy(WEDL03Faction)
DLC1DawnguardPatrolFaction.SetEnemy(WEDL05Faction)
DLC1DawnguardPatrolFaction.SetEnemy(WEDL06LutreshFaction)
DLC1DawnguardPatrolFaction.SetEnemy(WEDL06ThugFaction)
DLC1DawnguardPatrolFaction.SetEnemy(DaedraFaction)
DLC1DawnguardPatrolFaction.SetEnemy(SkeletonFaction)
DLC1DawnguardPatrolFaction.SetEnemy(NecromancerFaction)
DLC1DawnguardPatrolFaction.SetEnemy(FemaleVampiresFaction)
DLC1DawnguardPatrolFaction.SetEnemy(WispFaction)
DLC1DawnguardPatrolFaction.SetEnemy(HagravenFaction)
DLC1DawnguardPatrolFaction.SetEnemy(ghostFaction)
DLC1DawnguardPatrolFaction.SetEnemy(VampirePCFaction)
DLC1VampirePatrolFaction.SetEnemy(Game.GetFormFromFile(0x0002929A, "Dragonborn.esm") as Faction)
DLC1VampirePatrolFaction.SetEnemy(SilverHandFaction)
DLC1VampirePatrolFaction.SetEnemy(WEPlayerEnemy)
DLC1VampirePatrolFaction.SetEnemy(WEDL03Faction)
DLC1VampirePatrolFaction.SetEnemy(WEDL05Faction)
DLC1VampirePatrolFaction.SetEnemy(WEDL06LutreshFaction)
DLC1VampirePatrolFaction.SetEnemy(WEDL06ThugFaction)
DLC1VampirePatrolFaction.SetEnemy(BanditFaction)
DLC1VampirePatrolFaction.SetEnemy(PredatorFaction)
DLC1VampirePatrolFaction.SetEnemy(DragonFaction)
DLC1VampirePatrolFaction.SetEnemy(WerewolfFaction)
DLC1VampirePatrolFaction.SetEnemy(DA13AfflictedFaction)
DLC1VampirePatrolFaction.SetEnemy(WIThugFaction)
DLC1VampirePatrolFaction.SetEnemy(DLC1_WESC09Faction)
DLC1VampirePatrolFaction.SetEnemy(DLC2CultistFaction)
DLC1VampirePatrolFaction.SetEnemy(VigilantOfStendarrFaction)
DLC1VampirePatrolFaction.SetEnemy(DLC1HunterFaction)
DLC1VampirePatrolFaction.SetEnemy(DLC1HunterAgentsFaction)
DLC1HunterFactionNPC.SetEnemy(DLC1_WESC09Faction)
DLC1HunterFactionNPC.SetEnemy(WEDL03Faction)
DLC1HunterFactionNPC.SetEnemy(WEDL05Faction)
DLC1VampireFactionNPC.SetEnemy(WEDL03Faction)
DLC1VampireFactionNPC.SetEnemy(WEDL05Faction)
DLC1HunterFaction.SetEnemy(VampireFaction)
DLC1VampireFactionNPC.SetEnemy(DLC1_WESC09Faction)
MolagBalsVampiresFaction.SetEnemy(DLC1HunterFaction)
MolagBalsVampiresFaction.SetEnemy(DLC1HunterAgentsFaction)
HircineFightersFaction.SetEnemy(DLC1VampireFaction)
HircineFightersFaction.SetEnemy(DLC1VampireAgentsFaction)
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
if DLC2CultistAmbush.GetStageDone(10) || DLC2WE09.GetStageDone(10)
DLC2CultistFaction.SetEnemy(IsGuardFaction)
endif
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
MolagBalsVampiresFaction.SetEnemy(DLC2HunterFaction)

; Force a call to the cross-plugin script to make sure everything works immediately.
(Alias_Player as TCGInitLoad).OnPlayerLoadGame()

debug.trace(self + " TCGiSO Init quest DONE")

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
Message Property HelpLegendary Auto
Actor Property GabriellaREF Auto 
Actor Property ShipsNorthwindVoldseaREF Auto  
Actor Property ShipNorthwindDalanREF Auto  
Actor Property ShipsWindhelmKjarREF Auto  
Actor Property RoggvirREF Auto  
Actor Property AlvaREF Auto  
Actor Property HroggarREF Auto  
Actor Property LamiREF Auto  
Actor Property CamillaLeotelliREF Auto  
Actor Property LailatheUnbrokenREF Auto  
FormList Property DefaultNPCVoiceTypes auto
FormList Property VoicesFollowerAll auto
FormList Property VoicesFollowerNeutral auto
FormList Property VoicesFollowerRough auto
FormList Property VoicesMarriageAll auto
FormList Property VoicesMarriageArrogant auto
FormList Property VoicesMarriageRough auto
FormList Property VoicesMarriageAdoptionAll auto
FormList Property VoicesMarriageAdoptionArrogant auto
FormList Property VoicesMarriageAdoptionRough auto
VoiceType Property MaleNordCommander  Auto  
VoiceType Property FemaleNord  Auto  
VoiceType Property FemaleCommoner  Auto  
VoiceType Property FemaleCoward  Auto  
VoiceType Property FemaleElfHaughty  Auto  
VoiceType Property FemaleShrill  Auto  
VoiceType Property MaleCommander  Auto  
VoiceType Property MaleElfHaughty  Auto  
VoiceType Property FemaleUniqueVex  Auto  
VoiceType Property FemaleUniqueKarliah  Auto  
VoiceType Property FemaleUniqueMaven  Auto  
VoiceType Property FemaleUniqueElenwen  Auto  
Key Property SarethiFarmKey  Auto  
Key Property MerryfarmKey  Auto  
Faction Property ghostFaction Auto 
Faction Property WispFaction Auto 
Faction Property HagravenFaction Auto 
Faction Property DaedraFaction Auto
Faction Property SkeletonFaction Auto
Faction Property FemaleVampiresFaction Auto
Faction Property SolitudeVittoriaVicciHouseFaction Auto
Faction Property MolagBalsVampiresFaction  Auto
Faction Property HlaaluFarmFaction Auto
Faction Property SolitudeErikursHouseFaction Auto
Faction Property HollyFrostFarmFaction Auto
Faction Property BrandyMugFarmFaction Auto
Faction Property WEPlayerEnemy Auto
Faction Property WEPlayerFriend Auto
Faction Property DA10VampireFaction Auto
Faction Property DA11CannibalFaction Auto
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
Faction Property HunterFaction Auto  
Faction Property WerewolfFaction Auto  
Faction Property VampireThrallFaction Auto
Faction Property VampireFriendFaction Auto
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
Faction Property HircineFightersFaction  Auto
Faction Property ForswornFaction Auto
Faction Property GiantFaction Auto
Faction Property CaravanGuard Auto
Faction Property IsGuardFaction Auto
Faction Property BladesRecruitsFaction Auto
Faction Property WhiterunHouseBattleBornFaction Auto
Faction Property MarkarthHallofDeadFaction Auto
Faction Property PlayerMarriedFaction Auto
Faction Property RiftenMariseFaction Auto
Faction Property SolitudeOpeningPrisonerFaction  Auto  
Faction Property PredatorFaction  Auto  
Faction Property DA13AfflictedFaction  Auto  
Faction Property WIThugFaction  Auto  
Faction Property WEDL03Faction  Auto  
Faction Property WEDL05Faction  Auto
Faction Property WEDL06LutreshFaction  Auto
Faction Property WEDL06ThugFaction  Auto
Keyword Property Vampire Auto
Formlist Property RiftenMeaderyLockList Auto
Formlist Property RiftenFisheryLockList Auto
Formlist Property WerewolfHateFactions Auto  
Formlist Property HelpManualPC Auto  
Formlist Property HelpManualXbox Auto  
Formlist Property CrimeFactionsList Auto  
Formlist Property VoicesJarl Auto  
Formlist Property WIMournersVoiceTypesList Auto  
Formlist Property CWSoldierVoiceTypes Auto  
Formlist Property WIxxxVoiceTypes Auto  
Formlist Property WIAssault01VoiceTypes Auto  
Formlist Property WIChangeLocation01VoiceTypes Auto  
Formlist Property WIRemoveItem01VoiceTypes Auto  
Formlist Property WIGuardVoiceTypes Auto  
Formlist Property WIVendorVoiceTypes Auto  
Formlist Property VoicesNPCs Auto  
Formlist Property CWSharedInfoVoiceTypes Auto  
Formlist Property FavorGenericVoiceTypes Auto  
Formlist Property VoicesBrawling Auto  
Formlist Property WIRemoveItem03VoiceTypes Auto  
Formlist Property CWSoldierNonCommanderVoiceTypes Auto  
Formlist Property VoicesPlayer Auto  
Formlist Property VoicesCommonCombatant Auto  
Formlist Property AlcoholicDrinksList Auto  
Formlist Property TrapGasMagicDrawn Auto  
Formlist Property VoicesBandit Auto  
Formlist Property RiverwoodAlvorsHouseLockList Auto  
Formlist Property RiverwoodGerdursHouseLockList Auto  
Formlist Property WhiterunBelethorsGoodsFormList Auto  
Formlist Property WhiterunArcadiasCauldronFormList Auto  
Formlist Property WhiterunHouseBattleBornLockList Auto  
Formlist Property MarkarthTempleofDibellaLockList Auto  
Formlist Property WICraftItem01BlacksmithVoiceTypes Auto  
Formlist Property RoriksteadManorLockList Auto  
Formlist Property RiftenElgrimsElixirsLockList Auto  
Formlist Property WICommentCollegeRobesList Auto  
Formlist Property WICommentMagicDangerousVoices Auto  
Formlist Property GuardVoiceTypes Auto  
Formlist Property DialogueCombatEncountersFormList Auto  
Formlist Property CWCitizenAggressiveVoiceTypes Auto  
Formlist Property MorthalHighmoonHallLockList Auto  
Formlist Property TutorialBlacksmithList Auto  
Formlist Property WerewolfAlarmists Auto  
Outfit Property VampireOutfit  Auto  
Quest Property SolitudeOpening  Auto  
Quest Property dunAlftandQST Auto  
Quest Property T01  Auto  
Quest Property T02  Auto  
Quest Property TG06  Auto  
Quest Property dmWQQST  Auto  
Quest Property FreeformMarkarthO  Auto  
Quest Property DialogueMarkarth  Auto  
Quest Property DA01 Auto  
Quest Property DA01FIN Auto  
Cell Property HollyfrostFarm Auto
Cell Property HlaaluFarm Auto
Cell Property SolitudeVittoriaVicisHouse Auto
Cell Property SolitudeErikursHouse Auto
Cell Property BrandyMugFarm Auto
Cell Property BattleBornFarm Auto
Cell Property MarkarthHalloftheDead Auto
Cell Property RiftenMariseAravelsHouse Auto
Actorbase Property Jensine Auto
Actorbase Property DareneLimax Auto

;Dawnguard DLC
VoiceType Property DLC1MaleVampire  Auto  
VoiceType Property DLC1FemaleVampire  Auto  
VoiceType Property DLC1FemaleUniqueFura  Auto  
GlobalVariable Property DLC1PlayingVampireLine  Auto
GlobalVariable Property DLC1HarkonDead  Auto
GlobalVariable property DLC1RV06DoOnce AUTO
GlobalVariable property DLC1RV10DoOnce AUTO
Cell Property DLC1DawnguardHQ01 Auto
Cell Property DLC1VampireCastleGuildhall Auto

Faction Property DLC1_WESC09Faction  Auto
Faction Property DLC1VampireSeductionBoostFaction  Auto  
Faction Property DLC1VampireFeedNoCrimeFaction  Auto  
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
Faction Property DLC1VolkiharClanFaction  Auto  
Faction Property DLC1VampireAgentsFaction  Auto
Faction Property DLC1HunterAgentsFaction  Auto  
Faction Property DLC1HunterFactionNPC  Auto
Faction Property DLC1VampireFactionNPC  Auto
Faction Property DLC1DawnguardPatrolFaction  Auto
Faction Property DLC1VampirePatrolFaction  Auto
Faction Property DLC1VolkiharExteriorGuardFaction  Auto
Faction Property DLC1RadiantHunterBanditNecroVampAllys  Auto
Faction Property DLC1RadiantVampireBanditNecroAllys  Auto
Formlist Property DLC1VampireHateFactions Auto  
Formlist Property DLC1VoicesNonUnique Auto  
Formlist Property DLC1RadiantHighProfileFactions Auto  

Quest Property DLC1VQ01MiscObjective  Auto  
Quest Property DLC1RV10  Auto  
Quest Property DLC1VQ08  Auto 
Quest Property DialogueHunterBase  Auto  
Quest Property DialogueHunterVampireBlock  Auto
Quest Property DialogueVampireBase Auto
Quest Property DialogueVampireCuredBlock Auto
Quest Property DawnguardAgents  Auto
Quest Property VampireAgents  Auto  

Actorbase Property DLC1BedyrickBuckingford Auto
Actorbase Property DLC1BarbaraBuckingford Auto

;Hearthfire DLC
Formlist Property BYOHVoicesNonUnique Auto  

;Dragonborn DLC
Formlist Property DLC2VoicesNonUnique Auto  
Formlist Property DLC2VoiceTypesNonUniquePlusFrea Auto  
Formlist Property DLC2VoiceTypesNonUniquePlusRiekling Auto  
Faction Property DLC2_WESC01VampireFaction Auto  
Faction Property DLC2dunFrostmoonWerewolvesFaction Auto  
Faction Property DLC2CrimeRavenRockFaction Auto  
Faction Property DLC2SkaalVillageCitizenFaction Auto  
Faction Property DLC2ThirskNordCrimeFaction Auto  
Faction Property DLC2HunterFaction  Auto  
Faction Property DLC2CultistFaction  Auto  
Faction Property DLC2VampireFaction Auto 
Quest Property DLC2CultistAmbush  Auto  
Quest Property DLC2WE09  Auto  