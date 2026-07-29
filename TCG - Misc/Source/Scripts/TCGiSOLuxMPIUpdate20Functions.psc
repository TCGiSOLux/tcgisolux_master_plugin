Scriptname TCGiSOLuxMPIUpdate20Functions extends Quest  
{Script on TCGiSOLuxMasterPluginInteriorUpdate20 quest}

Function DaedraQuest()

Quest DA01 = Game.GetFormFromFile( 0x00028AD6, "Skyrim.esm" ) as Quest
Quest DA01FIN = Game.GetFormFromFile( 0x0001DD49, "Skyrim.esm" ) as Quest

If DA01.GetStageDone(100) == 1 && DA01Fin.GetStageDone(10) == 1
DA01Fin.SetStage(0)
endif

EndFunction

Function VampirismSystem()

GlobalVariable PlayerisVampire = Game.GetFormFromFile( 0x000ED06D, "Skyrim.esm" ) as GlobalVariable
Spell ChainLightningRightHand = Game.GetFormFromFile( 0x000BB96B, "Skyrim.esm" ) as Spell
Spell IceSpikeLeftHand = Game.GetFormFromFile( 0x00040000, "Skyrim.esm" ) as Spell
Spell IceStormRightHand = Game.GetFormFromFile( 0x000BB96A, "Skyrim.esm" ) as Spell
Spell IcySpearRightHand = Game.GetFormFromFile( 0x0010F7F7, "Skyrim.esm" ) as Spell
Spell LightningBoltRightHand = Game.GetFormFromFile( 0x000C96A2, "Skyrim.esm" ) as Spell
Spell ThunderboltRightHand = Game.GetFormFromFile( 0x0010F7F8, "Skyrim.esm" ) as Spell

if PlayerisVampire.GetValue() == 1
Game.GetPlayer().AddSpell(ChainLightningRightHand)
Game.GetPlayer().AddSpell(IceSpikeLeftHand)
Game.GetPlayer().AddSpell(IceStormRightHand)
Game.GetPlayer().AddSpell(IcySpearRightHand)
Game.GetPlayer().AddSpell(LightningBoltRightHand)
Game.GetPlayer().AddSpell(ThunderboltRightHand)
Endif

EndFunction

Function NewGuardVO()

VoiceType FemaleBreton = Game.GetFormFromFile( 0x84A, "New Female Guard.esp" ) as VoiceType
VoiceType FemaleGuard = Game.GetFormFromFile( 0x800, "New Female Guard.esp" ) as VoiceType
FormList DGArrestingGuardVoiceTypes = Game.GetFormFromFile( 0x00001327, "TCGiSOLux Master Plugin Interior.esm" ) as FormList

DGArrestingGuardVoiceTypes.AddForm(FemaleGuard)
DGArrestingGuardVoiceTypes.AddForm(FemaleBreton)

EndFunction