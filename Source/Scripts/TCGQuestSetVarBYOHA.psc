scriptname TCGQuestSetVarBYOHA extends ObjectReference  

Actor Property PlayerREF Auto
Actor Property NPCREF Auto
Actor Property NPCREF2 Auto
Bool Property ORFlag AUTO
GlobalVariable property TCGGlobalVariable AUTO
GlobalVariable property GameDaysPassedVar AUTO
Int Property ControlStage AUTO
Quest Property ControlQuest AUTO
GlobalVariable Property BYOHDisallowAdoption  Auto  

auto STATE Waiting

    Event onTriggerEnter(ObjectReference triggerRef)
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        If (triggerRef == (PlayerREF as ObjectReference))
            If TCGGlobalVariable.GetValueInt() == 0
                If ORFlag == True
                    If NPCREF.IsDead() == true && BYOHDisallowAdoption.GetValue()== 0 || NPCREF.IsDead() == true && NPCREF2.IsDead() == true && BYOHDisallowAdoption.GetValue()== 1
                        TCGGlobalVariable.SetValueInt(currentgamedays)
                        If ControlStage != 0
                            ControlQuest.SetStage(ControlStage)
                        EndIf
                        GoToState("Done")
                    Endif
                Else
                    If NPCREF.IsDead() == true && NPCREF2.IsDead() == true
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
        Endif
    Endevent
    
endSTATE

STATE Done
    ;Do Nothing
endSTATE