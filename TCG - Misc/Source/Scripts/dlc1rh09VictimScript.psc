Scriptname DLC1RH09VictimScript extends ReferenceAlias  
{Script attached to Victim Alias in TCGDLC1RH09 quest}

Event OnUpdate()

	Quest myQuest = GetOwningQuest()

	if myQuest.GetStage() < 255 && (GetActorReference().isDisabled() || GetActorReference().isDeleted())
		myQuest.SetStage(300) ;fail quest

	elseif myQuest.GetStage() < 255
		registerForSingleUpdate(5)

	endif
	
EndEvent