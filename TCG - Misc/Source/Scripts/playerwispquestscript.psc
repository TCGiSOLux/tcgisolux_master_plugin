Scriptname playerwispquestscript extends ActiveMagicEffect  

Quest Property CompanionsTrackingQuest auto
Shout Property MonsterShout auto
Race Property PolymorphRace auto
Spell Property PolymorphSpell auto
Perk property PolymorphPerk auto
Weapon Property MonsterWeapon auto
Int Property HP  Auto  
Int Property Stamina Auto
Int Property Magicka Auto
Race Property NewRace auto
Spell Property VFXSpell auto
VisualEffect Property VFX  Auto  
VisualEffect Property VFX2  Auto
VisualEffect Property VFX3 Auto
SPELL Property VFXSpell2  Auto
SPELL Property VFXSpell3  Auto
SPELL Property SoundSpell  Auto  
SPELL Property PolymorphSpell2  Auto
SPELL Property PolymorphSpell3  Auto
SPELL Property PolymorphSpell4  Auto
SPELL Property RevertSpell  Auto
SPELL Property MorphingSpell  Auto
float PlayerHP
float PlayerMG
float PlayerST

Event OnEffectStart(Actor Target, Actor Caster)
if (Target.GetActorBase().GetRace() != PolymorphRace)
VFX2.Play(Game.GetPlayer(), afTime = 3)
NewRace = Game.GetPlayer().GetRace()
Game.ForceThirdPerson()
Game.ShowFirstPersonGeometry(false)
Target.SetRace(PolymorphRace)
Game.GetPlayer().SetHeadTracking(false)
Game.GetPlayer().UnequipAll()
int playersHealth = Game.GetPlayer().GetActorValue("health") as int
PlayerHP = playersHealth
int playersMagicka = Game.GetPlayer().GetActorValue("magicka") as int
PlayerMG = playersMagicka
int playersStamina = Game.GetPlayer().GetActorValue("stamina") as int
PlayerST = playersStamina
Game.GetPlayer().SetActorValue("health", (PlayerHP/4 + HP))
Game.GetPlayer().SetActorValue("magicka", (PlayerMG/4 + Magicka))
Game.GetPlayer().SetActorValue("stamina", (PlayerST/4 + Stamina))
Game.GetPlayer().EquipSpell(PolymorphSpell, 0)
Game.GetPlayer().AddSpell(PolymorphSpell)
Game.GetPlayer().EquipSpell(PolymorphSpell2, 0)
Game.GetPlayer().AddPerk(PolymorphPerk)
Game.GetPlayer().AddSpell(PolymorphSpell2, 1)
Game.GetPlayer().Addspell(PolymorphSpell3, 1)
Game.GetPlayer().Addspell(PolymorphSpell4, 1)
Game.GetPlayer().Addspell(RevertSpell, 1)
SoundSpell.Cast(Game.GetPlayer())
Game.GetPlayer().AddItem(MonsterWeapon)
Game.GetPlayer().EquipItem(MonsterWeapon, 1)
Game.GetPlayer().AddItem(MonsterAmmo, 99)
Game.GetPlayer().EquipItem(MonsterAmmo)
Game.GetPlayer().AddItem(MonsterArmor)
Game.GetPlayer().EquipItem(MonsterArmor)
Game.GetPlayer().AddShout(MonsterShout)
VFXSpell2.Cast(Target)
VFXSpell.Cast(Target)
VFXSpell3.Cast(Target)
endif


EndEvent




Event OnEffectFinish(Actor Target, Actor Caster)

; change back
Game.GetPlayer().RemoveSpell(PolymorphSpell)
Game.GetPlayer().RemoveSpell(PolymorphSpell2)
Game.GetPlayer().RemoveSpell(PolymorphSpell3)
Game.GetPlayer().RemoveSpell(PolymorphSpell4)
Game.GetPlayer().RemovePerk(PolymorphPerk)
Game.GetPlayer().DispelSpell(VFXSpell)
Game.GetPlayer().RemoveSpell(VFXSpell)
Game.GetPlayer().DispelSpell(VFXSpell2)
Game.GetPlayer().RemoveSpell(VFXSpell2)
Game.GetPlayer().DispelSpell(VFXSpell3)
Game.GetPlayer().RemoveSpell(VFXSpell3)
Game.GetPlayer().RemoveSpell(SoundSpell)
Game.GetPlayer().DispelSpell(SoundSpell)
Game.GetPlayer().RemoveSpell(RevertSpell)
Game.GetPlayer().UnEquipSpell(PolymorphSpell, 0)
Game.GetPlayer().RemoveItem(MonsterWeapon)
Game.GetPlayer().UnEquipItem(MonsterWeapon, 1)
Game.GetPlayer().RemoveShout(MonsterShout)
Game.GetPlayer().UnEquipShout(MonsterShout)
Game.GetPlayer().RemoveItem(MonsterAmmo, 99)
Game.GetPlayer().UnEquipItem(MonsterAmmo)
Game.GetPlayer().RemoveItem(MonsterArmor)
Game.GetPlayer().UnEquipItem(MonsterArmor)
Game.ShowFirstPersonGeometry(true)
Game.GetPlayer().SetRace(Newrace)
Game.GetPlayer().SetActorValue("health", (PlayerHP))
Game.GetPlayer().SetActorValue("magicka", (PlayerMG))
Game.GetPlayer().SetActorValue("stamina", (PlayerST))


Debug.Trace("WISP: Setting race " + (CompanionsTrackingQuest as CompanionsHousekeepingScript).PlayerOriginalRace + " on " + Game.GetPlayer())
endEvent

Event OnSpellCast(Form akSpell)
Spell spellCast = akSpell as Spell
if spellCast && spellCast == RevertSpell
Game.GetPlayer().DispelSpell(MorphingSpell)
Endif
EndEvent


Ammo Property MonsterAmmo Auto
Armor Property MonsterArmor Auto
