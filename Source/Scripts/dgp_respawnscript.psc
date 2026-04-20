Scriptname DGP_RespawnScript extends Actor  

Float Property RespawnTime = 48.0 Auto  
ObjectReference Property SpawnLocationRef Auto  

Event OnDying(Actor Killer)
    RegisterForSingleUpdateGameTime(RespawnTime)
EndEvent

Event OnUpdateGameTime()
    if Self.IsDead()
        Self.Disable() 
        Utility.Wait(0.5) 
        Self.Resurrect()
        if SpawnLocationRef
            Self.MoveTo(SpawnLocationRef)  
        endif
        Self.Enable() 
    endif
EndEvent