;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TCGiSOLuxMPIUpdate03 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;START SETUP UPDATE PATCH V1.1

;FIX MISC OBJECTIVE WHICH NOT REACHING STAGE 250 AND ALSO FIX ISRAN NEVER LOST ESSENTIAL STATUS DURING QUEST DESTROYING THE DAWNGUARD
If DLC1VQ01MiscObjective.GetStageDone(200) == 1 && DLC1VQ01MiscObjective.GetStageDone(250) == 0 && DLC1RV10.GetStageDone(10) == 0
  DLC1VQ01MiscObjective.setStage(250)
Endif

;UPDATE COMPLETED, MAKE STOP THIS QUEST
Stop()
;END CODE
EndFunction
;END FRAGMENT
Quest Property DLC1VQ01MiscObjective  Auto  
Quest Property DLC1RV10  Auto  