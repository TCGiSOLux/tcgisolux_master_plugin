Scriptname TCGCheckVarSetStageNPCAliveMarker extends ObjectReference  
{
- Enables quest stages for a control quest, based on a requirement for a number of game days passed for each stage.

- Used for a control quest with multiple stages. 
- Specify control quest stages in properties, ControlQuestStage[] 
- Specify game days passed requirements variables in properties, DaysPassedRequirements[]
- The value of a global variable, TCGPlayerLevelGlobalVariable, is added to each LevelRequirements[]
- So for ControlQuestStage[i], the level requirment is LevelRequirements[i] + TCGPlayerLevelGlobalVariable

- If TCGPlayerLevelGlobalVariable is 0, the script will not run the check.
- Set a value for TCGPlayerLevelGlobalVariable in the plugin, or use another script to set it based on conditions.
- Set to 0 in the plugin if another script will be used to set it.

- For each stage, checks if the number of game days is above the game days min and below a game days maximum (requirement for the next stage)

- Also requires a specified NPC is alive as an additional condition
- If the NPC is dead, sets control quest to complete state 

- Runs when cell loads.
}

Actor Property PlayerREF Auto
GlobalVariable property TCGPlayerLevelGlobalVariable AUTO
Int[] Property DaysPassedRequirements AUTO
Actor Property NPCREF Auto
Quest Property ControlQuest AUTO
Int[] Property ControlQuestStage AUTO
GlobalVariable property GameDaysPassedVar AUTO

Auto STATE QuestTrigger

    Event OnCellLoad()
		if TCGPlayerLevelGlobalVariable.GetValueInt() > 0
            if NPCREF.IsDead() == false
                CheckDaysPassedSetStage(DaysPassedRequirements, PlayerRef)
            else
                ControlQuest.CompleteQuest()
                GoToState("Done")
            endif
        endif
        if ControlQuest.IsCompleted()
         GoToState("Done")
        endif
     endEvent

endState

STATE Done
    ;Do Nothing
endSTATE

;checks level requirements and enables quest stages if met
Function CheckDaysPassedSetStage(int[] DaysPassedRequirements, Actor PlayerREF)
    int currentdayspassed = GameDaysPassedVar.GetValueInt()
    int currentstage = ControlQuest.GetStage()
    int i = 0
    while i < DaysPassedRequirements.Length 
        ;minimum days passed requirement for quest stage
        int dayspassedmin = DaysPassedRequirements[i] + TCGPlayerLevelGlobalVariable.GetValueInt()
        ;max level requirement for quest stage
        int dayspassedreqmax = DaysPassedRequirements[i + 1] + TCGPlayerLevelGlobalVariable.GetValueInt()
        ;stage to enable
        int controlstage = ControlQuestStage[i]
        ;check if this index is the final index
        If i + 1 == DaysPassedRequirements.Length
            ;if true, no max level requirement
            If dayspassedmin <= currentdayspassed
                if controlstage > currentstage
                    ControlQuest.SetStage(controlstage)
                endif
            endif
        ;index is not the final index
        Else
            ;if min requirement is below current level
            If dayspassedmin <= currentdayspassed
                ;if max requirement is above current level
                if dayspassedreqmax > currentdayspassed
                    ;if the stage to be enabled is above the current stage, prevents quest from going backwards
                    if controlstage > currentstage
                        ControlQuest.SetStage(controlstage)
                    endif
                endif
            endif
        endIf
        i += 1
    endwhile
EndFunction