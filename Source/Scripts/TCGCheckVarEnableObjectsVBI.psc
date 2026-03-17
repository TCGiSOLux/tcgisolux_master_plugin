scriptname TCGCheckVarEnableObjectsVBI extends ObjectReference  

Actor Property PlayerREF Auto
GlobalVariable property TCGPlayerLevelGlobalVariable AUTO
Int Property DaysPassedRequirements AUTO
GlobalVariable property GameDaysPassedVar AUTO
ObjectReference[] Property EnableObjects AUTO

Auto STATE QuestTrigger

    Event onTriggerEnter(ObjectReference triggerRef)
        int currentdayspassed = GameDaysPassedVar.GetValueInt()
	    if (triggerRef == (PlayerREF as ObjectReference))
			if TCGPlayerLevelGlobalVariable.GetValueInt() > 0
                If currentdayspassed >= TCGPlayerLevelGlobalVariable.GetValueInt() + DaysPassedRequirements
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

; Enables objects specified in properties
Function EnableTheObjects(ObjectReference[] EnableObjects)
	int EnableObjectIndex = 0
	while (EnableObjectIndex < EnableObjects.Length)
		EnableObjects[EnableObjectIndex].Enable()
		EnableObjectIndex += 1
	endwhile
EndFunction