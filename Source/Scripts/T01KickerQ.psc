;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname T01KickerQ Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
EnterMarkarthCount.SetValueInt(EnterMarkarthCount.GetValueInt() + 1)

Debug.Trace("T01: Counting entrance to Markarth -- " + EnterMarkarthCount.GetValueInt())

if ((EnterMarkarthCount.GetValueInt() >= 4))
	if (  (GameHour.GetValueInt() >= 9) || (GameHour.GetValueInt() < 20)  )
 		Debug.Trace("T01: Kicking quest The Heart of Dibella start on Markarth entrance #" + EnterMarkarthCount.GetValueInt())
		T01.Start()
		T01Prologue.Start()
		T01PreEssentializing.Stop()
	endif
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property EnterMarkarthCount  Auto  
Quest Property T01  Auto  
Quest Property T01Prologue  Auto 
Quest Property T01PreEssentializing  Auto 
GlobalVariable Property GameHour  Auto  
GlobalVariable Property GameDaysPassed  Auto  