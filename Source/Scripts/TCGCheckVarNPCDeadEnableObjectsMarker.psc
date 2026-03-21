Scriptname TCGCheckVarNPCDeadEnableObjectsMarker extends ObjectReference  
{
- Enables and/or disables objects if a certain number of in-game days have passed since an event.
- Another script such as TCGQuestSetVar can set this global variable, or specify its value in the plugin.
- Objects will be enabled when a specified number of game days plus the value of this variable have passed.
- Runs when the player enters a trigger box.
}

Actor Property PlayerREF Auto
GlobalVariable property TCGPlayerLevelGlobalVariable AUTO
Int Property DaysPassedRequirements AUTO
GlobalVariable property GameDaysPassedVar AUTO
ObjectReference[] Property EnableObjects AUTO
ObjectReference[] Property DisableObjects AUTO
Actor Property NPCREF Auto


Auto STATE QuestTrigger

    Event OnCellLoad()
        int currentdayspassed = GameDaysPassedVar.GetValueInt()
		if TCGPlayerLevelGlobalVariable.GetValueInt() > 0 && NPCREF.IsDead() == true
            If currentdayspassed >= TCGPlayerLevelGlobalVariable.GetValueInt() + DaysPassedRequirements
                DisableTheObjects(DisableObjects)
                EnableTheObjects(EnableObjects)
                GoToState("Done")
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