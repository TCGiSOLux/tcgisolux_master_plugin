Scriptname SC64_WispmotherEffect extends ActiveMagicEffect  

ActorBase Property OrbBase Auto
ActorBase Property ShadeBase Auto
Float Property ShadeHealth Auto
spell property wispBuff01 auto
spell property wispBuff02 auto
spell property wispBuff03 auto
Explosion Property ExplosionIllusionLight01  Auto
VisualEffect Property WispFXAttachEffect Auto


;tracking the witchlights, shades, and the caster as separate actors
Actor Orb01
Actor Orb02
Actor Orb03
Actor Shade01
Actor Shade02
Actor selfRef

;keeping track of the number of witchlights and shades ingame
int iLiveOrbs = 0
int iLiveShades = 0
int doOnce 


;set up the orbs
Event OnEffectStart(Actor akTarget, Actor akCaster)
	selfRef = akcaster ;storing the caster's value for subsequent events
       WispFXAttachEffect.Play(selfRef, -1)
        Orb01 = SelfRef.PlaceActorAtMe(OrbBase)
	  SelfRef.AddSpell(WispBuff01) ;this is the health orb
        Orb02 = SelfRef.PlaceActorAtMe(OrbBase)
	  SelfRef.AddSpell(WispBuff02) ;this is the magicka orb
        Orb03 = SelfRef.PlaceActorAtMe(OrbBase)
	  SelfRef.AddSpell(WispBuff03) ;this is the stamina orb
	 ;reference the orb death script
        (Orb01 as SC64_OrbActor).OwningEffect = self
        (Orb02 as SC64_OrbActor).OwningEffect = self
        (Orb03 as SC64_OrbActor).OwningEffect = self
         iLiveOrbs = 3

    ;any other setup stuff

EndEvent

Event OnUpdate()
If SelfRef.GetActorValuePercentage("Health") > ShadeHealth && iLiveOrbs == 0 && iLiveShades == 0
	;place the orbs and give the wisp her buffs back
	SelfRef.setActorValue("Variable07",0)
        Orb01 = SelfRef.PlaceActorAtMe(OrbBase)
	  SelfRef.AddSpell(WispBuff01)
        Orb02 = SelfRef.PlaceActorAtMe(OrbBase)
	  SelfRef.AddSpell(WispBuff02)
        Orb03 = SelfRef.PlaceActorAtMe(OrbBase)
	  SelfRef.AddSpell(WispBuff03)
        (Orb01 as SC64_OrbActor).OwningEffect = self
        (Orb02 as SC64_OrbActor).OwningEffect = self
        (Orb03 as SC64_OrbActor).OwningEffect = self
	iLiveOrbs = 3
EndIf
If SelfRef.GetActorValuePercentage("Health") <= ShadeHealth && iLiveShades == 0
	;get rid of the orbs and place the shades
	Orb01.kill()
	Orb02.kill()
	Orb03.kill()
       Shade01 = SelfRef.PlaceActorAtMe(ShadeBase)
       Shade02 = SelfRef.PlaceActorAtMe(ShadeBase)
       (Shade01 as ShadeDeath).OwningEffect = self
       (Shade02 as ShadeDeath).OwningEffect = self
	 iLiveShades = 2
Endif
EndEvent

;custom event
Event OnOrbDeath(Actor akDeadOrb) ;track the dead orbs referenced in the actor script
        iLiveOrbs -= 1
        ;remove the buffs
if akDeadOrb == Orb01
	SelfRef.RemoveSpell(WispBuff01)
	SelfRef.DispelSpell(WispBuff01)
EndIf
if akDeadOrb == Orb02
	SelfRef.RemoveSpell(WispBuff02)
	SelfRef.DispelSpell(WispBuff02)
EndIf
if akDeadOrb == Orb03
	SelfRef.RemoveSpell(WispBuff03)
	SelfRef.DispelSpell(WispBuff03)
EndIf
if ILiveOrbs == 0
	SelfRef.setActorValue("Variable07",1)
	utility.wait(120.0)
	RegisterForSingleUpdate(1)
EndIf
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked) ;check for an update to spawn the shades
if  iLiveShades == 0 && SelfRef.GetActorValuePercentage("Health") <= ShadeHealth && doOnce == 0
	UnregisterforUpdate()
	doOnce = 1
	RegisterForSingleUpdate(1)
Endif
EndEvent

Event OnShadeDeath(Actor akDeadShade)
	iLiveShades -= 1
	;any other stuff you need to do
	if ILiveShades == 0
	Utility.Wait(120.0)
	doOnce = 0 ;allow the OnHit event to check for shades again
	RegisterForSingleUpdate(1)
	EndIf
EndEvent

Event OnCombatStateChanged(Actor victim, int aeCombatState)
if aeCombatState == 1	
	orb01.startCombat(victim)
	orb02.startCombat(victim)
	orb03.startCombat(victim)
	shade01.startCombat(victim)
	shade02.startCombat(victim)
Endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	WispFXAttachEffect.Stop(selfRef)
	Orb01.kill()
	Orb02.kill()
	Orb03.kill()
	Shade01.kill()
	Shade02.kill()
EndEvent

Event OnDying(Actor aKiller)
	SelfRef.SetCriticalStage(SelfRef.CritStage_DisintegrateStart)
	WispFXAttachEffect.Stop(selfRef)
	Utility.Wait(0.9)
	selfRef.placeatme(ExplosionIllusionLight01)
	Orb01.kill()
	Orb02.kill()
	Orb03.kill()
	Shade01.kill()
	Shade02.kill()
  SelfRef.SetCriticalStage(SelfRef.CritStage_DisintegrateEnd)
EndEvent 
