Scriptname WerewolfCrimeScript extends Actor  

; O'yinchi Werewolf bo'lganida, an'anaviy jinoyatlar haqida xabar berish o'chiriladi.
; Ko'pgina fraksiyalar o'yinchiga shu shaklda hujum qilayotganligi sababli, bu yaxshimi?
; Biroq, nima uchun CompanionsFaction fraksiyasining a'zolari munosabat bildirmayapti?
; Afsuski, agar o'yinchi Werewolf shaklida bo'lsa, ular munosabat bildirishmaydi.
; Faqat o'yinchi DLC1PlayerVampireLordFaction fraksiyasida bo'lmasa, tekshiriladi.

Event OnHit(ObjectReference Attacker, Form AttackSource, Projectile AttackProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)

	;Ushbu blokni qayta yozing. Bu aniq faqat o'yinchi uchun jarima solishga qaratilgan.
	;Oldingi blok ObjectReference ni aktyorga yangilashga urinish edi, bu mumkin emas.
	if( Attacker == Game.GetPlayer() )
	Faction CompanionsFaction = Game.GetFormFromFile(0x00048362, "Skyrim.esm") as Faction
	Race WerewolfBeastRace = Game.GetFormFromFile(0x000CDD84, "Skyrim.esm") as Race
	Faction DLC1PlayerVampireLordFaction = Game.GetFormFromFile(0x000071D3, "Dawnguard.esm") as Faction

		if( Game.GetPlayer().GetRace() == WerewolfBeastRace && Game.GetPlayer().IsInFaction(DLC1PlayerVampireLordFaction) == 0 )
			CompanionsFaction.SetEnemy(CompanionsFaction, true, true)
			CompanionsFaction.SetPlayerEnemy(TRUE)
			StartCombat(Game.GetPlayer())
			Utility.Wait(1)
			CompanionsFaction.SetPlayerEnemy(false)
			CompanionsFaction.SetAlly(CompanionsFaction)
			CompanionsFaction.SetCrimeGold(0)
			CompanionsFaction.SetCrimeGoldViolent(0)
		EndIf
	endIf

EndEvent
