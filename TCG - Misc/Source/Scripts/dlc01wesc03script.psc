Scriptname DLC01WESC03Script extends ObjectReference  
{Spawn a swarm of bats that fly at the player.}

Activator property DLC01_WESC03BatFX Auto
Quest property DLC01_WESC03 Auto
ReferenceAlias property Bat01 Auto
ReferenceAlias property Bat02 Auto
ReferenceAlias property Bat03 Auto
ReferenceAlias property Bat04 Auto
ReferenceAlias property Bat05 Auto
ReferenceAlias property Bat06 Auto
ReferenceAlias property Bat07 Auto
ReferenceAlias property Bat08 Auto
ReferenceAlias property Bat09 Auto
ReferenceAlias property Bat10 Auto
ReferenceAlias property SceneCenterMarker Auto
ReferenceAlias property SceneMarker1 Auto
ReferenceAlias property SceneMarker2 Auto
ReferenceAlias property SceneMarker3 Auto
ReferenceAlias property SceneMarker4 Auto

Event OnLoad()
	While (DLC01_WESC03.GetStage() == 0)
		if (SceneCenterMarker.GetReference().GetDistance(Game.GetPlayer()) > 2000)
			Utility.Wait(1)
		Else
			;Spawn the bats.
			Bat01.ForceRefTo(SceneCenterMarker.GetReference().PlaceAtMe(DLC01_WESC03BatFX))
			;Rotate and activate the bats.
			Bat01.GetReference().SetAngle(0, 0, Game.GetPlayer().GetAngleZ())
			Bat01.GetReference().Activate(Self)
			;Done here, so set the stage.
			DLC01_WESC03.SetStage(10)
		EndIf
	EndWhile
EndEvent

Event OnUnload()
	;USSEP 4.2.5 Bug #30585 - This doesn't need to happen twice. The event below is more reliable.
	;DLC01_WESC03.Stop()
EndEvent

Event OnCellDetach()
	DLC01_WESC03.Stop()
EndEvent