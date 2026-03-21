Scriptname TCGLevelSelfEnable extends ObjectReference  
{
- Checks if the player is above a certain level, specified in properties. If true, enables itself.
- Can specify a max level. Disables self if player's level is above
- If no max level is desired, set to zero
}

Actor Property PlayerREF Auto
Int Property TCGLevelRequirement AUTO
Int Property TCGLevelMax AUTO

auto State LevelTrigger

    Event OnCellLoad()
        int currentlevel = PlayerREF.GetLevel()
        if TCGLevelMax == 0
            if currentlevel >= TCGLevelRequirement
                self.enable()
                GoToState("Done")
            endif
        Else
            If currentlevel >= TCGLevelRequirement
                If currentlevel < TCGLevelMax
                    self.enable()
                else
                    self.disable()
                    GoToState("Done")
                EndIf
            endif           
        endif
    EndEvent

endState

STATE Done
    ;Do Nothing
endSTATE