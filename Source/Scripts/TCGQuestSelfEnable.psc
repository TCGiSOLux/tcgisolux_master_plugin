Scriptname TCGQuestSelfEnable extends ObjectReference  
{Checks if the player is above a specified quest stage. If true, enables itself. Runs on cell load.}

Quest Property TriggerQuest AUTO
Int Property TriggerQuestStage AUTO

auto State LevelTrigger

    Event OnCellLoad()
        Int QuestStage = TriggerQuest.GetStage()
        If QuestStage > TriggerQuestStage
            self.enable()
            GoToState("Done")     
        endif
    EndEvent

endState

STATE Done
    ;Do Nothing
endSTATE