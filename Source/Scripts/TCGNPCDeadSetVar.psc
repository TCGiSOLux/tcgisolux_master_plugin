Scriptname TCGNPCDeadSetVar extends ObjectReference  

Actor Property PlayerREF Auto
Actor Property NPCREF Auto
GlobalVariable property TCGGlobalVariable AUTO
GlobalVariable property GameDaysPassedVar AUTO

auto STATE Waiting

    Event onTriggerEnter(ObjectReference triggerRef)
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        If (triggerRef == (PlayerREF as ObjectReference))
            If TCGGlobalVariable.GetValueInt() == 0
                If NPCREF.IsDead() == true
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