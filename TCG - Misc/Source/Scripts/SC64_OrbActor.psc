Scriptname SC64_OrbActor extends Actor

Actor Property SummonWisp auto  

SC64_WispMotherEffect Property OwningEffect Auto

Event OnDeath(Actor akKiller)
    if OwningEffect != none
        OwningEffect.OnOrbDeath(self)
    endif
EndEvent