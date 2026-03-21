Scriptname TCGLevelSetVarMarker extends ObjectReference  
{
- Checks if the player is above a specified level
- If true, sets a global variable equal to the number of game days passed +1
- Can also set a stage in a control quest when triggered if desired. Otherwise set ControlStage to 0
- Attach to a xmarker. Script runs when cell loads
}

Actor Property PlayerREF Auto
Int Property TriggerLevel AUTO
GlobalVariable property TCGGlobalVariable AUTO
GlobalVariable property GameDaysPassedVar AUTO
Int Property ControlStage AUTO
Quest Property ControlQuest AUTO

auto STATE Waiting

    Event OnCellLoad()
        int currentlevel = PlayerREF.GetLevel()
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        If TCGGlobalVariable.GetValueInt() == 0
            If currentlevel >= TriggerLevel
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