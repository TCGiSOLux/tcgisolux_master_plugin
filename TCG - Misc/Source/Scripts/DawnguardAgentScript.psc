Scriptname DawnguardAgentScript extends Actor
{Aggression Dawnguard agent will be increased to 2, if player are completed quest The Bloodstone Chalice.}

bool NPCLoaded = False

Event OnLoad()
	if !NPCLoaded && !self.isdead() && (Game.GetFormFromFile(0x0000594C, "Dawnguard.esm") as Quest).GetStageDone(200) && !(Game.GetFormFromFile(0x00019938, "Dawnguard.esm") as Quest).GetStageDone(255)
	NPCLoaded = TRUE
	if (Game.GetFormFromFile(0x0002c358, "Skyrim.esm") as Quest).GetStageDone(100) && self.GetItemCount(Game.GetFormFromFile(0x0000D098, "Dawnguard.esm") as Weapon) == 0
	self.AddItem(Game.GetFormFromFile(0x0000D098, "Dawnguard.esm") as Weapon)
	self.EquipItem(Game.GetFormFromFile(0x0000D098, "Dawnguard.esm") as Weapon)
	else
	self.EquipItem(Game.GetFormFromFile(0x0000D098, "Dawnguard.esm") as Weapon)
	endif
	self.setcrimefaction(none)
	self.setAV("Aggression", 2)
	self.setAV("confidence", 0)
	self.SetAttackActorOnSight(true)
	endif
EndEvent

Event OnCellAttach()
	if !NPCLoaded && !self.isdead() && (Game.GetFormFromFile(0x0000594C, "Dawnguard.esm") as Quest).GetStageDone(200) && !(Game.GetFormFromFile(0x00019938, "Dawnguard.esm") as Quest).GetStageDone(255)
	NPCLoaded = TRUE
	if (Game.GetFormFromFile(0x0002c358, "Skyrim.esm") as Quest).GetStageDone(100) && self.GetItemCount(Game.GetFormFromFile(0x0000D098, "Dawnguard.esm") as Weapon) == 0
	self.AddItem(Game.GetFormFromFile(0x0000D098, "Dawnguard.esm") as Weapon)
	self.EquipItem(Game.GetFormFromFile(0x0000D098, "Dawnguard.esm") as Weapon)
	else
	self.EquipItem(Game.GetFormFromFile(0x0000D098, "Dawnguard.esm") as Weapon)
	endif
	self.setcrimefaction(none)
	self.setAV("Aggression", 2)
	self.setAV("confidence", 0)
	self.SetAttackActorOnSight(true)
	endif
EndEvent

Event OnCellDetach()
	if (Game.GetFormFromFile(0x0000594C, "Dawnguard.esm") as Quest).GetStageDone(200) && !(Game.GetFormFromFile(0x00019938, "Dawnguard.esm") as Quest).GetStageDone(255)
	self.setAV("Aggression", 1)
	self.setAV("confidence", 4)
	self.SetAttackActorOnSight(false)
	self.stopcombatalarm()
	game.getplayer().stopcombatalarm()
	self.setcrimefaction(Game.GetFormFromFile(0x000007DF, "TCGiSOLux Master Plugin Interior.esm") as Faction)
	NPCLoaded = FALSE
	endif
EndEvent