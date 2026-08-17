Scriptname dlc1vlscript extends Actor  


int Property TransformDistance = 300 auto


Function Transform()
	; do nothing by default
EndFunction

Auto State human
	Function Transform()
		GoToState("vampirelord")
		StopCombat()
		StopCombatAlarm()
		;UDBP 2.0.2 - Needs 3D check
		if( Is3DLoaded() )
			Spell DLC1VampireChange = Game.GetFormFromFile( 0x0000283B, "Dawnguard.esm" ) as Spell
			DLC1VampireChange.Cast(self)
		EndIf
		; SetAv("aggression", 3)
		; SetAv("confidence", 4)
		if( !IsDead() ) ; UDBP 2.0.1 added check for dead actor
			StartCombat(Game.GetPlayer())
		EndIf
	EndFunction	


	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		Transform()
	EndEvent
EndState

State vampirelord
	Event OnBeginState()
		UnregisterForUpdate() ; being overly cautious
	EndEvent
EndState


Event OnLoad()
	RegisterForSingleUpdate(1)
EndEvent

Event OnCellAttach()
	RegisterForSingleUpdate(1)
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
	if (Game.GetPlayer().GetDistance(self) <= TransformDistance)
		Transform()
	else
		RegisterForSingleUpdate(1)
	endif
EndEvent
