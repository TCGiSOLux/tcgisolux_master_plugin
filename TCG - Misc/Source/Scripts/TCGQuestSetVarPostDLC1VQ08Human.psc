scriptname TCGQuestSetVarPostDLC1VQ08Human extends ObjectReference  

Actor Property PlayerREF Auto
Quest Property TriggerQuest AUTO
Int Property TriggerQuestStage AUTO
GlobalVariable property TCGGlobalVariable AUTO
GlobalVariable property GameDaysPassedVar AUTO
Int Property ControlStage AUTO
Quest Property ControlQuest AUTO
GlobalVariable property DLC1PlayingVampireLine AUTO

auto STATE Waiting

    Event onTriggerEnter(ObjectReference triggerRef)
        Int currentstage = TriggerQuest.GetStage()
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        If (triggerRef == (PlayerREF as ObjectReference))
            If TCGGlobalVariable.GetValueInt() == 0
                If currentstage > TriggerQuestStage && DLC1PlayingVampireLine.GetValue()== 0
                    TCGGlobalVariable.SetValueInt(currentgamedays)
                    If ControlStage != 0
                        ControlQuest.SetStage(ControlStage)
                    EndIf
                    GoToState("Done")
                Endif
            Else
                GoToState("Done")
            Endif
        Endif
    Endevent
    
endSTATE

STATE Done
    ;Do Nothing
endSTATE