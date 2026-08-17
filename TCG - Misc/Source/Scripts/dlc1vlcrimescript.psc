Scriptname DLC1VLCrimeScript extends Actor  

; O'yinchi vampir lordi yoki Werewolf bo'lganida, an'anaviy jinoyatlar haqida xabar berish o'chiriladi.
; Ko'pgina fraksiyalar o'yinchiga shu shaklda hujum qilayotganligi sababli, bu yaxshimi?
; Biroq, nima uchun DLC1VampireCrimeFaction fraksiyasining a'zolari munosabat bildirmayapti?
; Afsuski, agar o'yinchi Werewolf yoki Vampir lordi shaklida bo'lsa, ular munosabat bildirishmaydi.

Event OnHit(ObjectReference Attacker, Form AttackSource, Projectile AttackProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)

	;Ushbu blokni qayta yozing. Bu aniq faqat o'yinchi uchun jarima solishga qaratilgan.
	;Oldingi blok ObjectReference ni aktyorga yangilashga urinish edi, bu mumkin emas.
	if( Attacker == Game.GetPlayer() )
	Faction DLC1VampireCrimeFaction = Game.GetFormFromFile(0x00017F71, "Dawnguard.esm") as Faction
	Faction PlayerWerewolfFaction = Game.GetFormFromFile(0x00091822, "Skyrim.esm") as Faction
	Race WerewolfBeastRace = Game.GetFormFromFile(0x000CDD84, "Skyrim.esm") as Race
	Faction DLC1PlayerVampireLordFaction = Game.GetFormFromFile(0x000071D3, "Dawnguard.esm") as Faction

		if( Game.GetPlayer().GetRace() == WerewolfBeastRace || Game.GetPlayer().GetRace() == DLC1VampireBeastRace )
			DLC1VampireFaction.SetEnemy(DLC1VampireFaction, true, true)
			DLC1VampireFaction.SetPlayerEnemy(TRUE)
			StartCombat(Game.GetPlayer())

			if( Game.GetPlayer().IsInFaction(PlayerWerewolfFaction) == 0 )
			DLC1VampireFaction.SetPlayerEnemy(false)
			DLC1VampireFaction.SetAlly(DLC1VampireFaction)
			DLC1VampireCrimeFaction.SetCrimeGold(0)
			DLC1VampireCrimeFaction.SetCrimeGoldViolent(0)
			endif

			if( Game.GetPlayer().IsInFaction(PlayerWerewolfFaction) == 0 && Game.GetPlayer().IsInFaction(DLC1PlayerVampireLordFaction) == 1 )
			DLC1VampireCrimeFaction.PlayerPayCrimeGold(False, False)
			endif

		EndIf
	endIf

EndEvent

Race Property DLC1VampireBeastRace  Auto  

Faction Property DLC1VampireFaction  Auto  
