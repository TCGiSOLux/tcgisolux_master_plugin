Scriptname TCGCivilWarToggle extends ObjectReference  
{Checks if area is controlled by Imperials or Stormcloaks.
Used to toggle guards, banners, etc. Useful for when guards and objects change from being present or not.
Suggested to be used on an xmarker that can be enabled or disabled for dynamic changes}

ObjectReference Property ImperialGarrisonMarker AUTO
; Set object to vanilla Imperial garrison xmarker of local area

ObjectReference Property SonsGarrisonMarker AUTO
; Set object to vanilla Stormcloak garrison xmarker of local area

ObjectReference Property NewImperialGarrisonMarker AUTO
; Create a new xmarker enable parent for Imperial objects
ObjectReference Property NewSonsGarrisonMarker AUTO
; Create a new xmarker enable parent for Stormcloak objects
    
Event OnCellLoad()
    if self.isenabled()
        if ImperialGarrisonMarker.isenabled()
            If NewImperialGarrisonMarker.IsDisabled()
                NewImperialGarrisonMarker.Enable()
            EndIf
            If NewSonsGarrisonMarker.isenabled()
                NewSonsGarrisonMarker.Disable()
            endif
        elseif SonsGarrisonMarker.IsEnabled()
            if NewSonsGarrisonMarker.IsDisabled()
                NewSonsGarrisonMarker.Enable()
            endif
            if NewImperialGarrisonMarker.IsEnabled()
                NewImperialGarrisonMarker.Disable()
            endif
        endIf
    endif 
endevent