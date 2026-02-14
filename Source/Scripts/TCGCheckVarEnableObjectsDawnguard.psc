scriptname TCGCheckVarEnableObjectsDawnguard extends ObjectReference  

Actor Property PlayerREF Auto
GlobalVariable property TCGPlayerLevelGlobalVariable AUTO
Int Property DaysPassedRequirements AUTO
GlobalVariable property GameDaysPassedVar AUTO
ObjectReference[] Property EnableObjects AUTO
ObjectReference[] Property DisableObjects AUTO
Actor Property NPCREF Auto

Auto STATE QuestTrigger

    Event onTriggerEnter(ObjectReference triggerRef)
        int currentdayspassed = GameDaysPassedVar.GetValueInt()
	    if (triggerRef == (PlayerREF as ObjectReference))
			if TCGPlayerLevelGlobalVariable.GetValueInt() > 0 && NPCREF.IsDead() == true
                If currentdayspassed >= TCGPlayerLevelGlobalVariable.GetValueInt() + DaysPassedRequirements
                    DisableTheObjects(DisableObjects)
                    EnableTheObjects(EnableObjects)
                    GoToState("Done")
                EndIf
            Endif
        Endif

    EndEvent

endState

STATE Done
    ;Do Nothing
endSTATE

; Disables objects specified in properties
Function DisableTheObjects(ObjectReference[] DisableObjects)
	int ObjectIndex = 0
	while (ObjectIndex < DisableObjects.Length)
		DisableObjects[ObjectIndex].Disable()
		ObjectIndex += 1
	endwhile
EndFunction

; Enables objects specified in properties
Function EnableTheObjects(ObjectReference[] EnableObjects)
	int EnableObjectIndex = 0
	while (EnableObjectIndex < EnableObjects.Length)
		EnableObjects[EnableObjectIndex].Enable()
		EnableObjectIndex += 1
	endwhile
EndFunction