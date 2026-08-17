Scriptname DLC1HunterBaseIntroDoorAliasScript extends ReferenceAlias  Conditional

Quest Property DLC1HunterBaseIntro  Auto  
ReferenceAlias Property ArielleAlias  Auto  
ReferenceAlias Property GunmarAlias  Auto  
ReferenceAlias Property IsranAlias  Auto  
ReferenceAlias Property FlorentiusAlias  Auto  
ObjectReference Property IsranMarker  Auto  
ObjectReference Property GunmarMarker  Auto  
ObjectReference Property ArielleMarker  Auto  
ObjectReference Property FlorentiusMarker  Auto  

int DoOnce



Event OnActivate (ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if DLC1HunterBaseIntro.GetStage() == 70
			if DoOnce == 0
				;Shut down Vampire Base Intro
				Quest DLC1VampireBaseIntro = Game.GetFormFromFile( 0x0000594C, "Dawnguard.esm" ) as Quest
				DLC1VampireBaseIntro.SetStage(300)
				ArielleAlias.GetReference().MoveTo(ArielleMarker)
				GunmarAlias.GetReference().MoveTo(GunmarMarker)
				;UDGP 2.0.1 - Serana's alias can be invalid here since Bloodlines might already be shut down.
				if( Serana.GetReference() != None )
					Serana.GetReference().MoveTo(DLC1VQ03HunterSeranaStart)
				EndIf
				IsranAlias.GetReference().MoveTo(IsranMarker)
				DLC1HunterBaseIntroEndScene.Start()
				DoOnce = 1
			endif
		endif
	endif


EndEvent

Scene Property DLC1HunterBaseIntroEndScene  Auto  
ReferenceAlias Property Serana  Auto  
ObjectReference Property DLC1VQ03HunterSeranaStart  Auto  
