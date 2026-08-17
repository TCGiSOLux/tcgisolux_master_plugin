Scriptname DLC2CrimeGuardsScript extends Quest  

GlobalVariable Property GameDaysPassed Auto
FavorDialogueScript Property FavorScript  Auto

Function SetupCidhnaMine()
	Quest CidhnaMineJailEventScene = Game.GetFormFromFile( 0x000CD13F, "Skyrim.esm" ) as Quest

	If CidhnaMineJailEventScene.GetStageDone(10) == 0
; 		debug.Trace("Running the Cidhna Mine intro scene")
		CidhnaMineJailEventScene.SetStage(10)
	EndIf

EndFunction


; call to set variable03 on guard when he decides to ignore petty crimegold
function SetLastArrestTime(Actor pGuard)
	float nextTime = GameDaysPassed.GetValue() + 1.0
	pGuard.SetActorValue("Variable03", nextTime)
endfunction


; call this to bribe a guard to look the other way
function BribeGuard(Actor pGuard)
	; pay bribe
	FavorScript.Bribe(pGuard)
	; stop alarms
	Game.GetPlayer().StopCombatAlarm()
endFunction

function PersuadeGuard(Actor pGuard)
	;use Persuade
	FavorScript.ArrestPersuade(pGuard)
	; stop alarms
	Game.GetPlayer().StopCombatAlarm()
endFunction