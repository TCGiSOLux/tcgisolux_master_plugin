Scriptname THOD_QE_TrackSleep Extends ReferenceAlias

Quest Property Favor250 Auto
Quest Property T01 Auto
Quest Property WICourier  Auto  
Book Property Letter  Auto  
Book Property LetterAlt  Auto  
ReferenceAlias Property MadanachAlias Auto
ObjectReference Property MadanachRef Auto
GlobalVariable Property FriendsCountReach Auto
GlobalVariable Property EnterMarkarthCount  Auto  

Event OnInit()
Utility.Wait(3)
MadanachAlias.ForceRefTo(MadanachRef)

If T01.GetStage() < 55 && EnterMarkarthCount.GetValueInt() >= 4
	 RegisterForSleep()
endif
EndEvent

Event OnSleepStop(bool abInterrupted)
	If Favor250.IsStageDone(25) && T01.GetStage() < 55 && EnterMarkarthCount.GetValueInt() >= 4
      (WICourier as WICourierScript).AddItemToContainer(Letter)
	UnregisterForSleep()

	elseif FriendsCountReach.GetValue() > 4 && T01.GetStage() < 55 && EnterMarkarthCount.GetValueInt() >= 4
	      (WICourier as WICourierScript).AddItemToContainer(LetterAlt)
	UnregisterForSleep()

	endif
EndEvent