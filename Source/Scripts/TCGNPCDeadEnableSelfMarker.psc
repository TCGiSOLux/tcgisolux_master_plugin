Scriptname TCGNPCDeadEnableSelfMarker extends ObjectReference  
{Checks if the NPC specified is dead, and if an object reference is enabled. If both are true, enables the object the script is attached to}

Actor Property NPC Auto
ObjectReference Property xmarker AUTO

Event OnCellLoad()
    if NPC.IsDead()
        If xmarker.IsEnabled()
            self.Enable()
        EndIf
    endif
EndEvent