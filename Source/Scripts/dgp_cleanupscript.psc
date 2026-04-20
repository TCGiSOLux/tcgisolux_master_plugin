Scriptname DGP_CleanupScript extends Quest

; Actor references from AABRREF01 to AABRREF15
Actor Property AABRREF01 Auto
Actor Property AABRREF02 Auto
Actor Property AABRREF03 Auto
Actor Property AABRREF04 Auto
Actor Property AABRREF05 Auto
Actor Property AABRREF06 Auto
Actor Property AABRREF07 Auto
Actor Property AABRREF08 Auto
Actor Property AABRREF09 Auto
Actor Property AABRREF10 Auto
Actor Property AABRREF11 Auto
Actor Property AABRREF12 Auto
Actor Property AABRREF13 Auto
Actor Property AABRREF14 Auto
Actor Property AABRREF15 Auto

; Marker or Spawn Cell Location for actors to be moved to
ObjectReference Property SpawnCellLocation Auto

; Explosion effect for light explosion
Explosion Property ExplosionIllusionLight01 Auto

; Global game hour variable
GlobalVariable Property GameHour Auto

; Time-related properties
float Property EnableTime = 5.0 Auto  ; Cleanup starts after 5 AM
float Property DisableTime = 21.0 Auto  ; Cleanup ends before 9 PM

; Global variable to check if cleanup has been performed today
GlobalVariable Property CleanupPerformed Auto

;***************************************************
; Event to initialize and start periodic checks
Event OnInit()
    ; Register for periodic updates based on the dynamic interval
    RegisterForSingleUpdateGameTime(GetInterval()) 
EndEvent

;***************************************************
; Event triggered on each game time update
Event OnUpdateGameTime()
    ; Get the current game hour
    float currentHour = GameHour.GetValue()

    ; Reset CleanupPerformed based on EnableTime and DisableTime
    If currentHour >= EnableTime && currentHour < DisableTime
        CleanupPerformed.SetValue(0)
    EndIf

    ; Check if it's between EnableTime and DisableTime, and cleanup has not been performed yet today
    If (currentHour >= EnableTime && currentHour < DisableTime && CleanupPerformed.GetValue() == 0)
        ; Perform cleanup for each actor
        CleanupActor(AABRREF01)
        CleanupActor(AABRREF02)
        CleanupActor(AABRREF03)
        CleanupActor(AABRREF04)
        CleanupActor(AABRREF05)
        CleanupActor(AABRREF06)
        CleanupActor(AABRREF07)
        CleanupActor(AABRREF08)
        CleanupActor(AABRREF09)
        CleanupActor(AABRREF10)
        CleanupActor(AABRREF11)
        CleanupActor(AABRREF12)
        CleanupActor(AABRREF13)
        CleanupActor(AABRREF14)
        CleanupActor(AABRREF15)

        ; Set the CleanupPerformed variable to 1, indicating cleanup has been done today
        CleanupPerformed.SetValue(1)
    EndIf

    ; Continue periodic updates based on the dynamic interval
    RegisterForSingleUpdateGameTime(GetInterval()) 
EndEvent

;***************************************************
; Cleanup function to handle actor based on its status
Function CleanupActor(Actor actorRef)
    ; Ensure actorRef is a valid reference
    If actorRef != None
        ; If actor is alive
        If actorRef.IsDead() == false
            ; Trigger explosion effect at the actor's location
            actorRef.PlaceAtMe(ExplosionIllusionLight01)

            ; Wait for the explosion effect to finish (0.5 seconds)
            Utility.Wait(0.5)

            ; Disable, move, and enable the actor
            actorRef.Disable()
            actorRef.MoveTo(SpawnCellLocation)
            actorRef.Enable()
            actorRef.Resurrect()
        Else
            ; If the actor is dead, just move and resurrect
            actorRef.Disable()
            actorRef.MoveTo(SpawnCellLocation)
            actorRef.Enable()
            actorRef.Resurrect()
        EndIf
    EndIf
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