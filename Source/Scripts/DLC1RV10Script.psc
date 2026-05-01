Scriptname DLC1RV10Script extends Quest  
{Script on DLC1RV10 quest}

ReferenceAlias Property Isran auto
ReferenceAlias Property Sorine auto
ReferenceAlias Property Gunmar auto
ReferenceAlias Property Florentius auto
ReferenceAlias Property Agmaer auto
ReferenceAlias Property Beleval auto
ReferenceAlias Property Celann auto
ReferenceAlias Property Durak auto
ReferenceAlias Property Ingjard auto
ReferenceAlias Property Jill auto
ReferenceAlias Property Kirsten auto
ReferenceAlias Property Tristyval auto
ReferenceAlias Property Sillina auto
ReferenceAlias Property Ingmarne auto
ReferenceAlias Property UthgerdTorbaldsen auto
ReferenceAlias Property HekatahMoabul auto


Outfit Property DLC1OutfitSorine  Auto  
Outfit Property DLC1OutfitGunmar  Auto  

Function CheckDead()
	if Isran.GetActorReference().IsDead() \
		&& Ingjard.GetActorReference().IsDead() \
		&& Jill.GetActorReference().IsDead() \
		&& Tristyval.GetActorReference().IsDead() \
		&& Sillina.GetActorReference().IsDead() \
		&& Ingmarne.GetActorReference().IsDead() \
		&& Kirsten.GetActorReference().IsDead() \
		&& Sorine.GetActorReference().IsDead() \
		&& Gunmar.GetActorReference().IsDead() \
		&& Florentius.GetActorReference().IsDead() \
		&& Agmaer.GetActorReference().IsDead() \
		&& Beleval.GetActorReference().IsDead() \
		&& Celann.GetActorReference().IsDead() \
		&& UthgerdTorbaldsen.GetActorReference().IsDead() \
		&& HekatahMoabul.GetActorReference().IsDead() \
		&& Durak.GetActorReference().IsDead()


		SetStage(100)

	endIf

EndFunction

Function StripEssentialAndEnable(ReferenceAlias WhichAlias)
	Actor ActorRef = WhichAlias.GetActorReference()

	ActorRef.Enable()
	ActorRef.GetActorBase().SetEssential(false)

EndFunction

