;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate18 Extends Quest Hidden

;BEGIN ALIAS PROPERTY HestlaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HestlaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StalfAliasBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StalfAliasBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RonthilAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RonthilAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RargalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RargalAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update

if DLC1VQ03Vampire.GetStageDone(200) == 1
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

Alias_RargalAlias.GetActorReference().MakePlayerFriend()
Alias_HestlaAlias.GetActorReference().MakePlayerFriend()
Alias_StalfAliasBackup.GetActorReference().MakePlayerFriend()
Alias_RonthilAlias.GetActorReference().MakePlayerFriend()

CompleteQuest()
Stop()
else
Stop()
Endif
;END CODE
EndFunction
;END FRAGMENT  

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property DLC1VQ03Vampire  Auto  