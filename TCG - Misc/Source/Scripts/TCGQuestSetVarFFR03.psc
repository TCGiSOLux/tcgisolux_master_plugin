scriptname TCGQuestSetVarFFR03 extends ObjectReference  
{
- Checks if a quest is above a specified stage
- If true, sets a global variable equal to the number of game days passed +1
- Can also set a stage in a control quest when triggered if desired. Otherwise set ControlStage to 0
- Attach to a trigger box. Script runs when player enters
}

Actor Property PlayerREF Auto
Actor Property NPCREF Auto
Quest Property TriggerQuest AUTO
Int Property TriggerQuestStage AUTO
Bool Property ORFlag AUTO
GlobalVariable property TCGGlobalVariable AUTO
GlobalVariable property GameDaysPassedVar AUTO
GlobalVariable property FFRiften03Arrested AUTO
Int Property ControlStage AUTO
Quest Property ControlQuest AUTO

auto STATE Waiting

    Event onTriggerEnter(ObjectReference triggerRef)
        Int currentstage = TriggerQuest.GetStage()
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        If (triggerRef == (PlayerREF as ObjectReference))
            If TCGGlobalVariable.GetValueInt() == 0
                If ORFlag == True
                    If NPCREF.IsDead() == true || currentstage > TriggerQuestStage && FFRiften03Arrested.GetValue()== 1
                        TCGGlobalVariable.SetValueInt(currentgamedays)
                        If ControlStage != 0
                            ControlQuest.SetStage(ControlStage)
                        EndIf
                        GoToState("Done")
                    Endif
                Else
                    If NPCREF.IsDead() == true || currentstage > TriggerQuestStage && FFRiften03Arrested.GetValue()== 1
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