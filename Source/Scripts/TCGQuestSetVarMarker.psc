Scriptname TCGQuestSetVarMarker extends ObjectReference  
{
- Checks if a quest is above a specified stage
- If true, sets a global variable equal to the number of game days passed +1
- Can also set a stage in a control quest when triggered if desired. Otherwise set ControlStage to 0
- Attach to a trigger box. Script runs when player enters
}

Actor Property PlayerREF Auto
Quest Property TriggerQuest AUTO
Int Property TriggerQuestStage AUTO
GlobalVariable property TCGGlobalVariable AUTO
GlobalVariable property GameDaysPassedVar AUTO
Int Property ControlStage AUTO
Quest Property ControlQuest AUTO

auto STATE Waiting

    Event OnCellLoad()
        Int currentstage = TriggerQuest.GetStage()
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        If TCGGlobalVariable.GetValueInt() == 0
            If currentstage > TriggerQuestStage
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