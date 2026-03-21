Scriptname TCGx2QuestSetVarMarker extends ObjectReference  
{
- Checks if a two quests are above specified stages
- If true, sets a global variable equal to the number of game days passed +1
- Quest requirements can be 'and'/'or', set by the flag. Set as 'and' by default
- Can also set a stage in a control quest when triggered if desired. Otherwise set ControlStage to 0
- Attach to a xmarker. Script runs when cell loads
}

Actor Property PlayerREF Auto
Quest Property TriggerQuestA AUTO
Int Property TriggerQuestBStage AUTO
Quest Property TriggerQuestB AUTO
Int Property TriggerQuestAStage AUTO
Bool Property ORFlag AUTO
GlobalVariable property TCGGlobalVariable AUTO
GlobalVariable property GameDaysPassedVar AUTO
Int Property ControlStage AUTO
Quest Property ControlQuest AUTO

auto STATE Waiting

    Event OnCellLoad()
        Int currentstageA = TriggerQuestA.GetStage()
        Int currentstageB = TriggerQuestB.GetStage()
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        If TCGGlobalVariable.GetValueInt() == 0
            If ORFlag == True
                If currentstageA > TriggerQuestAStage || currentstageB > TriggerQuestBStage
                    TCGGlobalVariable.SetValueInt(currentgamedays)
                    If ControlStage != 0
                        ControlQuest.SetStage(ControlStage)
                    EndIf
                    GoToState("Done")
                Endif
            Else
                If currentstageA > TriggerQuestAStage && currentstageB > TriggerQuestBStage
                    TCGGlobalVariable.SetValueInt(currentgamedays)
                    If ControlStage != 0
                        ControlQuest.SetStage(ControlStage)
                    EndIf
                    GoToState("Done")
                Endif
            Endif
        Else
            GoToState("Done")
        Endif
    Endevent
    
endSTATE

STATE Done
    ;Do Nothing
endSTATE