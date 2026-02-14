Scriptname TCGGameDaysSelfEnable extends ObjectReference  
{
- Checks if a specified number of days have passed in game. If true, enables itself.
- Can specify a max. Disables self if above max game days.
- If no max is desired, set to zero.
- Runs on cell load.
}

Actor Property PlayerREF Auto
Int Property TCGGameDaysRequirement AUTO
Int Property TCGGameDaysMax AUTO
GlobalVariable property GameDaysPassedVar AUTO

auto State LevelTrigger

    Event OnCellLoad()
        int currentgamedays = GameDaysPassedVar.GetValueInt()
        if TCGGameDaysMax == 0
            if currentgamedays >= TCGGameDaysRequirement
                self.enable()
            endif
        Else
            If currentgamedays >= TCGGameDaysRequirement
                If currentgamedays < TCGGameDaysMax
                    self.enable()
                else
                    self.disable()
                EndIf
            endif           
        endif
    EndEvent

endState

STATE Done
    ;Do Nothing
endSTATE