Scriptname DawnguardAgentScript extends Actor
{Aggression Dawnguard agent will be increased to 2, if player are completed quest The Bloodstone Chalice.}

bool NPCLoaded = False

Event OnLoad()
	if !NPCLoaded && !self.isdead() && Game.GetPlayer().GetDistance(self) <= 512 && (Game.GetFormFromFile(0x0000594C, "Dawnguard.esm") as Quest).GetStageDone(200) && !(Game.GetFormFromFile(0x00019938, "Dawnguard.esm") as Quest).GetStageDone(255)
	NPCLoaded = TRUE
	(Game.GetFormFromFile(0x00106ADE, "Skyrim.esm") as visualeffect).Play(self)
	self.setAV("Aggression", 2)
	self.setAV("confidence", 4)
	self.SetAttackActorOnSight(true)
	self.AddItem(Game.GetFormFromFile(0x0000D098, "Dawnguard.esm") as Weapon)
	self.EquipItem(Game.GetFormFromFile(0x0000D098, "Dawnguard.esm") as Weapon)
	endif
EndEvent

Event Onunload()
	if NPCLoaded && (Game.GetFormFromFile(0x0000594C, "Dawnguard.esm") as Quest).GetStageDone(200) && !(Game.GetFormFromFile(0x00019938, "Dawnguard.esm") as Quest).GetStageDone(255)
	self.setAV("Aggression", 1)
	self.SetAttackActorOnSight(false)
	NPCLoaded = FALSE
	endif
EndEvent

Event OnCellDetach()
	if NPCLoaded && (Game.GetFormFromFile(0x0000594C, "Dawnguard.esm") as Quest).GetStageDone(200) && !(Game.GetFormFromFile(0x00019938, "Dawnguard.esm") as Quest).GetStageDone(255)
	self.setAV("Aggression", 1)
	self.SetAttackActorOnSight(false)
	NPCLoaded = FALSE
	endif
EndEvent