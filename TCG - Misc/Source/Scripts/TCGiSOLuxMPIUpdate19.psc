;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate19 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update

if DLC1VQ03Vampire.GetStageDone(200) == 1
Alias_HestlaAliasBackup.GetActorReference().AddtoFaction(PotentialFollowerFaction)
Alias_HestlaAliasBackup.GetActorReference().AddtoFaction(CurrentFollowerFaction)
Alias_HestlaAliasBackup.GetActorReference().SetFactionRank(CurrentFollowerFaction, -1)
Alias_HestlaAliasBackup.GetActorReference().MakePlayerFriend()

Alias_RonthilAliasBackup.GetActorReference().AddtoFaction(PotentialFollowerFaction)
Alias_RonthilAliasBackup.GetActorReference().AddtoFaction(CurrentFollowerFaction)
Alias_RonthilAliasBackup.GetActorReference().SetFactionRank(CurrentFollowerFaction, -1)
Alias_RonthilAliasBackup.GetActorReference().MakePlayerFriend()
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

Faction Property PotentialFollowerFaction  Auto

Faction Property CurrentFollowerFaction  Auto  

Int Property NewProperty  Auto  
