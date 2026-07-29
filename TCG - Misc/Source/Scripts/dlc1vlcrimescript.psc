Scriptname DLC1VLCrimeScript extends Actor  

Event OnHit(ObjectReference Attacker, Form AttackSource, Projectile AttackProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)

	;UDGP 2.0.1 - Rewrote this block. It is clearly intended to invoke the penalty only for the player.
	;Previous block was trying to upcast an ObjectReference to an Actor, which is not possible.
	if( Attacker == Game.GetPlayer() )
	Faction DLC1VampireCrimeFaction = Game.GetFormFromFile(0x00017F71, "Dawnguard.esm") as Faction
	Faction PlayerWerewolfFaction = Game.GetFormFromFile(0x00091822, "Skyrim.esm") as Faction

		if( Game.GetPlayer().GetRace() == DLC1VampireBeastRace && Game.GetPlayer().IsInFaction(PlayerWerewolfFaction) == 0 )
			DLC1VampireFaction.SetEnemy(DLC1VampireFaction, true, true)
			DLC1VampireFaction.SetPlayerEnemy(TRUE)
			StartCombat(Game.GetPlayer())
			DLC1VampireFaction.SetPlayerEnemy(false)
			DLC1VampireFaction.SetAlly(DLC1VampireFaction)
			DLC1VampireCrimeFaction.SetCrimeGold(0)
			DLC1VampireCrimeFaction.SetCrimeGoldViolent(0)
		EndIf
	endIf

EndEvent

Race Property DLC1VampireBeastRace  Auto  

Faction Property DLC1VampireFaction  Auto  
