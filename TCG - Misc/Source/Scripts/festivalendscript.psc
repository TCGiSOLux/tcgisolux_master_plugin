Scriptname FestivalEndScript extends ObjectReference

Quest Property MS05KingOlafsFestival Auto
Int Property Stage = 200 Auto
float property minBreakdownTimer = 15.0 auto
GlobalVariable Property GameHour Auto
bool unloaded = False

Int Function GetDayOfWeek()
	Int GameDaysPassed
 
	GameDaysPassed = Utility.GetCurrentGameTime() as Int
	return (GameDaysPassed % 7) as Int
EndFunction

Auto State Waiting
EndState

State Listening
	Event onBeginState()
	if( !unloaded )
	unRegisterForUpdate()
	registerForSingleUpdate(minBreakdownTimer)
	EndIf
	endEvent
	
	Event OnUnload()
	if( !unloaded )
	unloaded = True
	MS05KingOlafsFestival.Setstage(20)
	MS05KingOlafsFestival.Setstage(Stage)
	EndIf
	endEvent
	
	Event onCellDetach()
	if( !unloaded )
	unloaded = True
	MS05KingOlafsFestival.Setstage(20)
	MS05KingOlafsFestival.Setstage(Stage)
	EndIf
	endEvent
Endstate

State Done
	Event onCellDetach()
		if !MS05KingOlafsFestival.GetStageDone(Stage) || !unloaded
			Debug.Notification("Restarting FestivalEndScript...")
			GotoState("Listening")
		endIf
	endEvent
EndState

Event onUpdate()
	;if !self.getParentCell().isAttached()
	;USKP 2.0.1 - Changed to use Is3DLoaded since GetParentCell will always return none when not attached.
	if( !Is3DLoaded() && !unloaded )
		Float CurrentHour = GameHour.GetValue()
		
		if ((GetDayOfWeek() == 6) && (CurrentHour >= 20.00)) || ((GetDayOfWeek() == 0) && (CurrentHour < 4.00))
			registerForSingleUpdate(minBreakdownTimer)
		Else
			GotoState("Done")
			MS05KingOlafsFestival.Setstage(Stage)
			unRegisterForUpdate()
		EndIf
	else
		registerForSingleUpdate(minBreakdownTimer)
	endIf
endEvent