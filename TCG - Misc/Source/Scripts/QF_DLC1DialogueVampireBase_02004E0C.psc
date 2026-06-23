;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 57
Scriptname QF_DLC1DialogueVampireBase_02004E0C Extends Quest Hidden

;BEGIN ALIAS PROPERTY FuraAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FuraAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ValgrittaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ValgrittaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RargalAliasBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RargalAliasBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GaranAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GaranAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StalfAliasBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StalfAliasBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JulisandeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JulisandeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HestlaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HestlaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HarkonAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HarkonAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RonthilAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RonthilAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VingalmoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VingalmoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BetnarreAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BetnarreAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VolrinaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VolrinaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HertAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HertAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StalfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StalfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SaloniaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SaloniaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SaloniaAliasBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SaloniaAliasBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TutorialThrallMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TutorialThrallMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VirngringAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VirngringAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RoxwinneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RoxwinneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TutorialThrall
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TutorialThrall Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VireveriAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VireveriAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RargalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RargalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FilbenethAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FilbenethAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrthjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OrthjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoruliaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoruliaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FeranAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FeranAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LucretiaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LucretiaAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN CODE
Alias_HestlaAlias.GetActorReference().AddtoFaction(PotentialFollowerFaction)
Alias_StalfAliasBackup.GetActorReference().AddtoFaction(PotentialFollowerFaction)
Alias_RonthilAlias.GetActorReference().AddtoFaction(PotentialFollowerFaction)
Alias_RargalAlias.GetActorReference().AddtoFaction(PotentialFollowerFaction)

Alias_HestlaAlias.GetActorReference().AddtoFaction(CurrentFollowerFaction)
Alias_StalfAliasBackup.GetActorReference().AddtoFaction(CurrentFollowerFaction)
Alias_RonthilAlias.GetActorReference().AddtoFaction(CurrentFollowerFaction)
Alias_RargalAlias.GetActorReference().AddtoFaction(CurrentFollowerFaction)

Alias_HestlaAlias.GetActorReference().SetFactionRank(CurrentFollowerFaction, -1)
Alias_StalfAliasBackup.GetActorReference().SetFactionRank(CurrentFollowerFaction, -1)
Alias_RonthilAlias.GetActorReference().SetFactionRank(CurrentFollowerFaction, -1)
Alias_RargalAlias.GetActorReference().SetFactionRank(CurrentFollowerFaction, -1)
Utility.Wait(3)
Alias_RargalAlias.GetActorReference().MakePlayerFriend()
Alias_HestlaAlias.GetActorReference().MakePlayerFriend()
Alias_StalfAliasBackup.GetActorReference().MakePlayerFriend()
Alias_RonthilAlias.GetActorReference().MakePlayerFriend()
Alias_HertAlias.GetActorReference().MakePlayerFriend()
Alias_JulisandeAlias.GetActorReference().MakePlayerFriend()
Utility.Wait(2)
Alias_VirngringAlias.GetActorReference().MakePlayerFriend()
Alias_VireveriAlias.GetActorReference().MakePlayerFriend()
Alias_BetnarreAlias.GetActorReference().MakePlayerFriend()
Alias_RoxwinneAlias.GetActorReference().MakePlayerFriend()
Alias_FilbenethAlias.GetActorReference().MakePlayerFriend()
Alias_VolrinaAlias.GetActorReference().MakePlayerFriend()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PotentialFollowerFaction  Auto
Faction Property CurrentFollowerFaction  Auto  
