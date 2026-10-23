Scriptname playerwispquestscript extends ActiveMagicEffect  

Int Property HP  Auto  
Int Property Magicka Auto
Armor Property MonsterArmor Auto
Weapon Property MonsterWeapon auto
SPELL Property MorphingSpell  Auto
Race Property NewRace auto
Race Property PolymorphRace auto
Spell Property PolymorphSpell2 auto
Spell Property PolymorphSpell3 auto
Spell Property PolymorphSpell auto
Spell Property RevertSpell  Auto
Spell Property SoundSpell  Auto
Int Property Stamina Auto
GlobalVariable Property WispIsPermanently Auto

float PlayerHP
float PlayerMG
float PlayerST

Event OnEffectStart(Actor Target, Actor Caster)
if (Target.GetActorBase().GetRace() != PolymorphRace)
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
Game.GetPlayer().AddSpell(PolymorphSpell2, 1)
Game.GetPlayer().Addspell(PolymorphSpell3, 1)
Game.GetPlayer().Addspell(RevertSpell, 1)
SoundSpell.Cast(Game.GetPlayer())
Game.GetPlayer().AddItem(MonsterWeapon)
Game.GetPlayer().EquipItem(MonsterWeapon, 1)
WispIsPermanently.SetValue(1)
Game.GetPlayer().AddItem(MonsterArmor)
Game.GetPlayer().EquipItem(MonsterArmor)
endIf

If WispIsPermanently.Value == 1
Spell PolymorphWispmotherSpell = Game.GetFormFromFile( 0x000034CB, "TCGiSOLux Master Plugin Interior.esm" ) as Spell
Spell PolymorphWispmotherVampireSpell = Game.GetFormFromFile( 0x000034EB, "TCGiSOLux Master Plugin Interior.esm" ) as Spell
Spell ShapeShiftWispmother = Game.GetFormFromFile( 0x000034C9, "TCGiSOLux Master Plugin Interior.esm" ) as Spell
Spell ShapeShiftWispmotherPermanently = Game.GetFormFromFile( 0x00003502, "TCGiSOLux Master Plugin Interior.esm" ) as Spell
Spell ShapeShiftWispmotherVampire = Game.GetFormFromFile( 0x000034EC, "TCGiSOLux Master Plugin Interior.esm" ) as Spell
Spell ShapeShiftWispmotherVampirePermanently = Game.GetFormFromFile( 0x000034E7, "TCGiSOLux Master Plugin Interior.esm" ) as Spell

Game.GetPlayer().RemoveSpell(RevertSpell)
Game.GetPlayer().RemoveSpell(PolymorphSpell)

Game.GetPlayer().RemoveSpell(PolymorphWispmotherSpell)
Game.GetPlayer().RemoveSpell(PolymorphWispmotherVampireSpell)
Game.GetPlayer().RemoveSpell(ShapeShiftWispmother)
Game.GetPlayer().RemoveSpell(ShapeShiftWispmotherPermanently)
Game.GetPlayer().RemoveSpell(ShapeShiftWispmotherVampire)
Game.GetPlayer().RemoveSpell(ShapeShiftWispmotherVampirePermanently)
endif

EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
If WispIsPermanently.Value == 0
Game.GetPlayer().RemoveSpell(PolymorphSpell)
Game.GetPlayer().RemoveSpell(PolymorphSpell2)
Game.GetPlayer().RemoveSpell(PolymorphSpell3)
Game.GetPlayer().RemoveSpell(SoundSpell)
Game.GetPlayer().DispelSpell(SoundSpell)
Game.GetPlayer().RemoveSpell(RevertSpell)
Game.GetPlayer().UnEquipSpell(PolymorphSpell, 0)
Game.GetPlayer().RemoveItem(MonsterWeapon)
Game.GetPlayer().UnEquipItem(MonsterWeapon, 1)
Game.ShowFirstPersonGeometry(true)
Game.GetPlayer().SetRace(Newrace)
Game.GetPlayer().SetActorValue("health", (PlayerHP))
Game.GetPlayer().SetActorValue("magicka", (PlayerMG))
Game.GetPlayer().SetActorValue("stamina", (PlayerST))
Game.GetPlayer().RemoveItem(MonsterArmor)
Game.GetPlayer().UnEquipItem(MonsterArmor)
endIf

endEvent

Event OnSpellCast(Form akSpell)
Spell spellCast = akSpell as Spell
if spellCast && spellCast == RevertSpell && WispIsPermanently.Value == 0
Game.GetPlayer().DispelSpell(MorphingSpell)
Endif
EndEvent