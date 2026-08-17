Scriptname TCGQuestSetVarDA07 extends ObjectReference  

Actor Property PlayerREF Auto
Actor Property NPCREF Auto
Actor Property NPCREF2 Auto
Quest Property TriggerQuest AUTO
Int Property TriggerQuestStage AUTO
GlobalVariable property TCGGlobalVariable AUTO
GlobalVariable property GameDaysPassedVar AUTO

auto STATE Waiting

    Event onTriggerEnter(ObjectReference triggerRef)
        Int currentstage = TriggerQuest.GetStage()
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        If (triggerRef == (PlayerREF as ObjectReference))
            If TCGGlobalVariable.GetValueInt() == 0
                If currentstage > TriggerQuestStage && NPCREF.IsDead() == true && NPCREF2.IsDead() == true
                    TCGGlobalVariable.SetValueInt(currentgamedays)
                EndIf
            Else
                GoToState("Done")
            Endif
        Endif
    Endevent
    
endSTATE

STATE Done
    ;Do Nothing
endSTATE