Scriptname DLC1WEDB12SarthisAndOrini extends ReferenceAlias  

ReferenceAlias Property SarthisIdren  Auto  
ReferenceAlias Property OriniDral  Auto  

Event OnDeath(Actor akKiller)
	Faction DLC1HunterFaction = Game.GetFormFromFile(0x00003375, "Dawnguard.esm") as Faction

	If (SarthisIdren.GetActorReference().IsDead()) && (OriniDral.GetActorReference().IsDead()) && game.getplayer().IsInFaction(DLC1HunterFaction) && getowningquest().getstagedone(100)
	GetOwningQuest().Stop()
	endif

	If (SarthisIdren.GetActorReference().IsDead()) && (OriniDral.GetActorReference().IsDead()) && !game.getplayer().IsInFaction(DLC1HunterFaction)
	GetOwningQuest().Stop()
	endif

EndEvent

Event OnUnload()
	GetOwningQuest().Stop()
EndEvent

Event OnCellDetach()
	GetOwningQuest().Stop()
EndEvent