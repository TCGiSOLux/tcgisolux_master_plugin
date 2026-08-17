;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname TCGiSOLuxMPIUpdate20 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start update Daedric Quest
DaedraQuest()
;END CODE
EndFunction

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Start update Vampirism
VampirismSystem()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Start update DGArrestingGuardVoiceTypes formlist
NewGuardVO()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Function DaedraQuest()

Quest DA01 = Game.GetFormFromFile( 0x00028AD6, "Skyrim.esm" ) as Quest
Quest DA01FIN = Game.GetFormFromFile( 0x0001DD49, "Skyrim.esm" ) as Quest

If DA01.GetStageDone(100) == 1 && DA01Fin.GetStageDone(10) == 1
DA01Fin.SetStage(0)
endif

SetStage(10)

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

SetStage(20)
EndFunction

Function NewGuardVO()

VoiceType FemaleBreton = Game.GetFormFromFile( 0x84A, "New Female Guard.esp" ) as VoiceType
VoiceType FemaleGuard = Game.GetFormFromFile( 0x800, "New Female Guard.esp" ) as VoiceType
FormList DGArrestingGuardVoiceTypes = Game.GetFormFromFile( 0x00001327, "TCGiSOLux Master Plugin Interior.esm" ) as FormList

DGArrestingGuardVoiceTypes.AddForm(FemaleGuard)
DGArrestingGuardVoiceTypes.AddForm(FemaleBreton)

EndFunction
