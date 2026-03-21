scriptname TCGQuestSetVarPostDLC1VQ08Vampire extends ObjectReference  

Actor Property PlayerREF Auto
Quest Property TriggerQuestA AUTO
Int Property TriggerQuestAStage AUTO
Quest Property TriggerQuestB AUTO
Int Property TriggerQuestBStage AUTO
Quest Property TriggerQuestC AUTO
Int Property TriggerQuestCStage AUTO
GlobalVariable property DLC1PlayingVampireLine AUTO
GlobalVariable property TCGGlobalVariable AUTO
GlobalVariable property GameDaysPassedVar AUTO
Int Property ControlStage AUTO
Quest Property ControlQuest AUTO

auto STATE Waiting

    Event onTriggerEnter(ObjectReference triggerRef)
        Int currentstage = TriggerQuest.GetStage()
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        If (triggerRef == (PlayerREF as ObjectReference))
            If TCGGlobalVariable.GetValueInt() == 0
                If currentstageA > TriggerQuestAStage && currentstageB > TriggerQuestBStage && currentstageC > TriggerQuestCStage && DLC1PlayingVampireLine.GetValue()== 1
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