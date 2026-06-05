Scriptname TGAssaultScript extends ObjectReference  Conditional

Quest Property TGBan Auto
Faction Property ThievesGuildFaction Auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	if Game.GetPlayer().IsInFaction(ThievesGuildFaction) == 1
		if akTarget == Game.GetPlayer()
			if aeCombatState == 1
				if TGBan.IsRunning() == 0
					TGBan.Start()
					else
					Game.QuitToMainMenu()
				endif
			endif
		endif
	endif

endEvent

Event OnDeath(Actor akKiller)

	if akKiller == Game.GetPlayer()
		if Game.GetPlayer().IsInFaction(ThievesGuildFaction) == 1
			if TGBan.IsRunning() == 0
				TGBan.Start()
				else
				Game.QuitToMainMenu()
			endif
		endif
	endif

endEvent