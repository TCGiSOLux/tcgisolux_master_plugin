Scriptname DLC1VLCrimeScript extends Actor  

Event OnHit(ObjectReference Attacker, Form AttackSource, Projectile AttackProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)

	if( Attacker == Game.GetPlayer() )
	Faction DLC1VampireCrimeFaction = Game.GetFormFromFile(0x00017F71, "Dawnguard.esm") as Faction
	Faction PlayerWerewolfFaction = Game.GetFormFromFile(0x00091822, "Skyrim.esm") as Faction
	Race WerewolfBeastRace = Game.GetFormFromFile(0x000CDD84, "Skyrim.esm") as Race
	Faction DLC1PlayerVampireLordFaction = Game.GetFormFromFile(0x000071D3, "Dawnguard.esm") as Faction

		if( Game.GetPlayer().GetRace() == WerewolfBeastRace || Game.GetPlayer().GetRace() == DLC1VampireBeastRace )
			DLC1VampireFaction.SetEnemy(DLC1VampireFaction, true, true) ; make hostility to player, if player are assaulted a Volkihar Clan members while in VL form
			DLC1VampireFaction.SetPlayerEnemy(TRUE)
			StartCombat(Game.GetPlayer())
			Utility.Wait(2)
			if( !Game.GetPlayer().IsInFaction(PlayerWerewolfFaction) )
			DLC1VampireFaction.SetPlayerEnemy(false)
			DLC1VampireFaction.SetAlly(DLC1VampireFaction)
			DLC1VampireCrimeFaction.SetCrimeGold(0)
			DLC1VampireCrimeFaction.SetCrimeGoldViolent(0)
			endif
		EndIf
	endIf

EndEvent

Race Property DLC1VampireBeastRace  Auto  
Faction Property DLC1VampireFaction  Auto  