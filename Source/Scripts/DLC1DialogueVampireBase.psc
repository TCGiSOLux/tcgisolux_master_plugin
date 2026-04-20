;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1DialogueVampireBase Extends Quest Hidden

;BEGIN ALIAS PROPERTY RargalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RargalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HertAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HertAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RonthilAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RonthilAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JulisandeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JulisandeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VirngringAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VirngringAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VireveriAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VireveriAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BetnarreAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BetnarreAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RoxwinneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RoxwinneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FilbenethAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FilbenethAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VolrinaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VolrinaAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Volkihar Keep
Alias_RargalAlias.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_HertAlias.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_RonthilAlias.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_JulisandeAlias.GetActorReference().SetRelationshipRank(Game.Getplayer(), 1)
;Fort Volkihar Clan
Alias_VirngringAlias.GetActorReference().SetRelationshipRank(Game.Getplayer(), 1)
Alias_VireveriAlias.GetActorReference().SetRelationshipRank(Game.Getplayer(), 1)
Alias_BetnarreAlias.GetActorReference().SetRelationshipRank(Game.Getplayer(), 1)
Alias_RoxwinneAlias.GetActorReference().SetRelationshipRank(Game.Getplayer(), 1)
Alias_FilbenethAlias.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_VolrinaAlias.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
;END CODE
EndFunction
;END FRAGMENT
