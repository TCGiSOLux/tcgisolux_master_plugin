scriptname TCGx2QuestSetVarandx4NPCDeadSetVar extends ObjectReference  
{
- Checks if a two quests are above specified stages
- If true, sets a global variable equal to the number of game days passed +1
- Quest requirements can be 'and'/'or', set by the flag. Set as 'and' by default
- Can also set a stage in a control quest when triggered if desired. Otherwise set ControlStage to 0
- Attach to a triggerbox. Script runs when player enters
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
Actor Property NPCREF Auto
Actor Property NPCREF2 Auto
Actor Property NPCREF3 Auto
Actor Property NPCREF4 Auto

auto STATE Waiting

    Event onTriggerEnter(ObjectReference triggerRef)
        Int currentstageA = TriggerQuestA.GetStage()
        Int currentstageB = TriggerQuestB.GetStage()
        int currentgamedays = GameDaysPassedVar.GetValueInt() + 1
        if (triggerRef == (PlayerREF as ObjectReference))
            If TCGGlobalVariable.GetValueInt() == 0
                If ORFlag == True
                    If currentstageA > TriggerQuestAStage && NPCREF.IsDead() == true && NPCREF2.IsDead() == true && NPCREF3.IsDead() == true && NPCREF4.IsDead() == true || currentstageB > TriggerQuestBStage && NPCREF.IsDead() == true && NPCREF2.IsDead() == true && NPCREF3.IsDead() == true && NPCREF4.IsDead() == true 
                        TCGGlobalVariable.SetValueInt(currentgamedays)
                        If ControlStage != 0
                            ControlQuest.SetStage(ControlStage)
                        EndIf
                        GoToState("Done")
                    Endif
                Else
                    If currentstageA > TriggerQuestAStage && currentstageB > TriggerQuestBStage && NPCREF.IsDead() == true && NPCREF2.IsDead() == true && NPCREF3.IsDead() == true && NPCREF4.IsDead() == true
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