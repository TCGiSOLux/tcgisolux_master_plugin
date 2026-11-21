ScriptName MS02ForswornScript extends ReferenceAlias

Event OnDeath(Actor akKiller)

	If akKiller == Game.GetPlayer()
		GetOwningQuest().SetStage(200)

		int cfIndex = 0
		if (cfIndex < (Game.GetFormFromFile(0x00026953, "Skyrim.esm") as FormList).GetSize())
		((Game.GetFormFromFile(0x00026953, "Skyrim.esm") as FormList).GetAt(cfIndex) as Faction).SetCrimeGold(0)
		((Game.GetFormFromFile(0x00026953, "Skyrim.esm") as FormList).GetAt(cfIndex) as Faction).SetCrimeGoldViolent(0)
		((Game.GetFormFromFile(0x00026953, "Skyrim.esm") as FormList).GetAt(cfIndex) as Faction).SetPlayerEnemy(false)
		cfIndex += 1
		endif

		if getowningquest().getstagedone(0)
		(Game.GetFormFromFile(0x0002816B, "Skyrim.esm") as Faction).SetCrimeGold(3000)
		endif
	EndIf

EndEvent