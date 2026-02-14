Scriptname TCGLevelAndNPCDeadCheckMarker extends ObjectReference  
{
- Checks if an NPC is dead. If true, script turns off and nothing happens.
- If false, checks if the player is above a certain level, specified in properties. If true, enables itself.
}

Actor Property PlayerREF Auto
Int Property TCGPlayerLevelRequirement AUTO
Int Property TCGPlayerLevelMax AUTO
Actor Property NPC Auto

auto State LevelTrigger

    Event OnCellLoad()
        int currentlevel = PlayerREF.GetLevel()
        if NPC.IsDead()
            GoToState("Done")
        Else
            if TCGPlayerLevelMax == 0
                if currentlevel >= TCGPlayerLevelRequirement
                    ;debug.MessageBox("There is NO max level, and the player is above the required level")
                    self.enable()
                endif
            Else
                If currentlevel >= TCGPlayerLevelRequirement
                    ;debug.MessageBox("There is a max level, and the player is above the required level")
                    If currentlevel < TCGPlayerLevelMax
                        ;debug.MessageBox(", and is below the max level")
                        self.enable()
                    else
                        ;debug.MessageBox(", but is NOT below the max level")
                        self.disable()
                        GoToState("Done")
                    EndIf
                endif
            endif           
        endif
    EndEvent

endState

STATE Done
    ;Do Nothing
endSTATE