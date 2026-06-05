Scriptname TCGDGBoatScript extends ObjectReference  

Message Property TCGDGBoatMessage  Auto  
Actor Property PlayerRef  Auto  
ObjectReference Property IcewaterJettyMarker  Auto  
ObjectReference Property SolitudeMarker  Auto  
ObjectReference Property MorthalMarker  Auto  
ObjectReference Property DawnstarMarker  Auto  
ObjectReference Property WinterholdMarker  Auto  
ObjectReference Property WindhelmMarker  Auto  

Event OnActivate(ObjectReference ActivateRef)
	If ActivateRef == PlayerRef
		Menu()
	EndIf
EndEvent

Function Menu(int aiButton = 0)
	aiButton = TCGDGBoatMessage.Show()
	If aiButton == 0
		Game.FastTravel(IcewaterJettyMarker)
	ElseIf aiButton == 1
		Game.FastTravel(SolitudeMarker)
	ElseIf aiButton == 2
		Game.FastTravel(MorthalMarker)
	ElseIf aiButton == 3
		Game.FastTravel(DawnstarMarker)
	ElseIf aiButton == 4
		Game.FastTravel(WinterholdMarker)
	ElseIf aiButton == 5
		Game.FastTravel(WindhelmMarker)
	EndIf
EndFunction