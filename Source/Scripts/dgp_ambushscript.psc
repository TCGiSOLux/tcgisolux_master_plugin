Scriptname DGP_AmbushScript extends ObjectReference  

; Faction that triggers the ambush when a member enters the trigger area
Faction Property AmbushTriggerFaction Auto  

; References to ambushing actors 
Actor Property AABRREF1 Auto  
Actor Property AABRREF2 Auto  
Actor Property AABRREF3 Auto  

; Marker reference where the ambushers will appear
ObjectReference Property XMarkerHeadingRef Auto  

; Explosion effect 
Explosion Property ExplosionIllusionLight01 Auto 

; Global variables for tracking the game hour and ambush status
GlobalVariable Property GameHour Auto  
GlobalVariable Property AmbushChanceOccurred Auto  

; Probability of ambush happening, defined as a percentage (1-100)
Int Property iChance Auto  

; Time settings: define when the ambush is allowed to happen
float Property EnableTime = 21.0 Auto  ; Start at 21:00 (9 PM)  
float Property DisableTime = 5.0 Auto   ; End at 05:00 (5 AM)  

;***************************************************
; Initialization event that runs when the script is first loaded
Event OnInit()
    ; Failsafe to ensure that EnableTime is within 0.0 - 24.0 range
    If EnableTime < 0.0 || EnableTime > 24.0
        EnableTime = 21.0  ; Default to 21:00 if it's out of bounds
    EndIf

    ; Failsafe to ensure that DisableTime is within 0.0 - 24.0 range
    If DisableTime < 0.0 || DisableTime > 24.0
        DisableTime = 5.0   ; Default to 5:00 if it's out of bounds
    EndIf

    ; Register the script for an update based on the game time interval
    RegisterForSingleUpdateGameTime(GetInterval())
EndEvent

;***************************************************
; Event triggered when an actor enters the designated trigger area
Event OnTriggerEnter(ObjectReference akActionRef)
    ; Check if the actor is part of the ambush trigger faction
    If akActionRef as Actor && (akActionRef as Actor).IsInFaction(AmbushTriggerFaction)
        ; Ensure that it's the active time (between 21:00 and 05:00) and ambush hasn't happened yet
        If IsActiveTime() && AmbushChanceOccurred.GetValue() == 0 
            ; Generate a random number to decide if ambush should occur based on the chance
            Int iRandom = Utility.RandomInt(1, 100)
            If (iRandom <= iChance)
                
                ; Light explosion effect at the ambush spawn marker
                XMarkerHeadingRef.PlaceAtMe(ExplosionIllusionLight01)

                ; Resurrect and prepare AABRREF1 if it's assigned
                If AABRREF1 != None
                    AABRREF1.Resurrect()
                    AABRREF1.Disable()
                    AABRREF1.Enable()
                    AABRREF1.SetAV("Aggression", 2)
                    AABRREF1.MoveTo(XMarkerHeadingRef)
                EndIf
                
                ; Resurrect and prepare AABRREF2 if it's assigned
                If AABRREF2 != None
                    AABRREF2.Resurrect()
                    AABRREF2.Disable()
                    AABRREF2.Enable()
                    AABRREF2.SetAV("Aggression", 2)
                    AABRREF2.MoveTo(XMarkerHeadingRef)
                EndIf
                
                ; Resurrect and prepare AABRREF3 if it's assigned
                If AABRREF3 != None
                    AABRREF3.Resurrect()
                    AABRREF3.Disable()
                    AABRREF3.Enable()
                    AABRREF3.SetAV("Aggression", 2)
                    AABRREF3.MoveTo(XMarkerHeadingRef)
                EndIf
            EndIf
            
            ; Mark ambush as occurred for the night to prevent it from repeating
            AmbushChanceOccurred.SetValue(1)
        EndIf
    EndIf
EndEvent
;***************************************************
; Event triggered when the game time updates (e.g., every 10 minutes) to check and reset the ambush condition
Event OnUpdateGameTime()
    ; Get the current game hour from the global variable
    float fGHour = GameHour.GetValue()
    
; If the current time is between EnableTime and DisableTime, reset the ambush flag
If fGHour >= EnableTime || fGHour < DisableTime
    AmbushChanceOccurred.SetValue(0)
EndIf

    ; Register the script to check the game time again after a certain interval
    RegisterForSingleUpdateGameTime(GetInterval())
EndEvent

;***************************************************
; Function to check if the current time falls within the active ambush time (21:00 - 05:00)
bool Function IsActiveTime()
    float fGHour = GameHour.GetValue()
    return (fGHour >= 21.0 || fGHour < 5.0)  ; Active between 21:00 and 05:00
EndFunction

;***************************************************
; Function to calculate the interval for the next update
float Function GetInterval()
    ; Declare variables to calculate time intervals
    float int1
    float int2
    float newinterval
    float fGHour = GameHour.GetValue()

    ; Calculate the time until EnableTime
    If EnableTime >= fGHour
        int1 = EnableTime - fGHour
    Else
        int1 = EnableTime - fGHour + 24  
    EndIf

    ; Calculate the time until DisableTime
    If DisableTime >= fGHour
        int2 = DisableTime - fGHour
    Else
        int2 = DisableTime - fGHour + 24  
    EndIf

    ; Choose the smaller time interval to minimize unnecessary updates
    If int1 <= int2  
        newinterval = int1
    Else
        newinterval = int2
    EndIf

    ; Ensure the interval is not too small (minimum of about 10 minutes)
    If newinterval < 0.167
        newinterval = 0.167  ; Set the minimum update interval
    EndIf

    ; Return the calculated interval
    Return newinterval
EndFunction