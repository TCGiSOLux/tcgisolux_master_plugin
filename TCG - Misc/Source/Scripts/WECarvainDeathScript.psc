scriptName WECarvainDeathScript extends actor
{script that sets a global variable when Talsgar is killed}

GlobalVariable property WECarvainsKilled auto

Event OnDeath(Actor akKiller)
	Quest WEDL03 = Game.GetFormFromFile( 0x000B8143, "Skyrim.esm" ) as Quest
	Quest WEDL04 = Game.GetFormFromFile( 0x000B91D8, "Skyrim.esm" ) as Quest
	WECarvainsKilled.setValue(1)

	If WEDL03.IsRunning()
	WEDL03.CompleteQuest()
	WEDL03.Stop() ; Current queue WE must be stopped to give another queue WE
	endif

	If WEDL04.IsRunning()
	WEDL04.CompleteQuest()
	WEDL04.Stop() ; Current queue WE must be stopped to give another queue WE
	endif

endEvent
