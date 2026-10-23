ScriptName DLC1VQ08VampAggressionScript extends ReferenceAlias
{This is to set the aggression and confidence on vampires during the siege}

Quest Property DLC1VQ08 auto
GlobalVariable Property DLC1PlayingVampireLine auto
Faction Property DLC1VQ08VampireSiegeFaction auto

auto State Waiting
	event onCellAttach()
		if !DLC1PlayingVampireLine.getValue() && DLC1VQ08.getStage() >= 40
			self.getActorReference().addToFaction(DLC1VQ08VampireSiegeFaction)
			self.getActorReference().setAV("Aggression", 1)
			self.getActorReference().setAV("Confidence", 4) ; default confidence to normal members are 0
			goToState("Done")
		endif
	endEvent

	event OnCellDetach()
		if !DLC1PlayingVampireLine.getValue() && self.GetActorReference().IsInFaction(DLC1VQ08VampireSiegeFaction) == 1
			self.getActorReference().RemoveFromFaction(DLC1VQ08VampireSiegeFaction)
			goToState("Done")
		endif
	endEvent

endState

State Done
endState
