Scriptname ShadeDeath extends Actor  

SC64_WispMotherEffect Property OwningEffect Auto

Event OnDeath(Actor akKiller)
    if OwningEffect != none
        OwningEffect.OnShadeDeath(self)
    endif
EndEvent