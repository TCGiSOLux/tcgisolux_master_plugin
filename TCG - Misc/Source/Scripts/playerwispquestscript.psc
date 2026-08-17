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
endif

if (Game.IsPluginInstalled("WispMotherHumanoidReplacer.esp"))
Outfit WispMotherOutfit = Game.GetFormFromFile( 0x00000800, "WispMotherHumanoidReplacer.esp" ) as Outfit
Game.GetPlayer().SetOutfit(WispMotherOutfit)
Game.GetPlayer().AddItem(MonsterArmor)
Game.GetPlayer().EquipItem(MonsterArmor)
else
Game.GetPlayer().AddItem(MonsterArmor)
Game.GetPlayer().EquipItem(MonsterArmor)
endIf

EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
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

if (Game.IsPluginInstalled("WispMotherHumanoidReplacer.esp"))
Armor WispCloak = Game.GetFormFromFile( 0x00000D6B, "WispMotherHumanoidReplacer.esp" ) as Armor
Armor WispHood = Game.GetFormFromFile( 0x00000D6C, "WispMotherHumanoidReplacer.esp" ) as Armor
Game.GetPlayer().RemoveItem(WispCloak)
Game.GetPlayer().RemoveItem(WispHood)
Game.GetPlayer().UnEquipItem(WispCloak)
Game.GetPlayer().UnEquipItem(WispHood)
Game.GetPlayer().RemoveItem(MonsterArmor)
Game.GetPlayer().UnEquipItem(MonsterArmor)
else
Game.GetPlayer().RemoveItem(MonsterArmor)
Game.GetPlayer().UnEquipItem(MonsterArmor)
endIf

endEvent

Event OnSpellCast(Form akSpell)
Spell spellCast = akSpell as Spell
if spellCast && spellCast == RevertSpell
Game.GetPlayer().DispelSpell(MorphingSpell)
Endif
EndEvent