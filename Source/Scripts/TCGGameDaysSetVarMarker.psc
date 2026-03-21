Scriptname TCGGameDaysSetVarMarker extends ObjectReference  
{
- Checks if a specified number of game days has passed
- If true, sets a global variable equal to the number of game days passed +1
- Attach to a xmarker. Script runs when cell loads
}

Actor Property PlayerREF Auto
Int Property TriggerGameDays AUTO
GlobalVariable property TCGGlobalVariable AUTO
GlobalVariable property GameDaysPassedVar AUTO
Int Property ControlStage AUTO
Quest Property ControlQuest AUTO

auto STATE Waiting

    Event OnCellLoad()
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        If TCGGlobalVariable.GetValueInt() == 0
            If currentgamedays > TriggerGameDays
                TCGGlobalVariable.SetValueInt(currentgamedays)
                If ControlStage != 0
                    ControlQuest.SetStage(ControlStage)
                EndIf
                GoToState("Done")
            Endif
        Else
            GoToState("Done")
        Endif
    Endevent
    
endSTATE

STATE Done
    ;Do Nothing
endSTATE