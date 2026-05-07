Scriptname TCGDimhollowStartScript extends ObjectReference  

Quest Property MQ203  Auto  
Quest Property DLC1VQ01  Auto  
Quest Property DLC1VQ01MiscObjective  Auto  

Event OnTriggerEnter(objectReference triggerRef)
	If TriggerRef == Game.GetPlayer()
		If DLC1VQ01MiscObjective.GetStageDone(180) == 0 && MQ203.GetStage() >= 280
			DLC1VQ01MiscObjective.Start()
			DLC1VQ01.Start()
			DLC1VQ01.Setstage(5)
			DLC1VQ01.Setstage(10)
		EndIf
	Endif
EndEvent