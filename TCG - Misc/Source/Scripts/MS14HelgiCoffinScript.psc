Scriptname MS14HelgiCoffinScript extends ReferenceAlias  

ObjectReference Property NewProperty  Auto  
ReferenceAlias Property Helgi  Auto  

Event OnActivate(ObjectReference ActorRef)
    If ActorRef == Game.GetPlayer()
        If GetOwningQuest().GetStage() >= 40 && GetOwningQuest().GetStage() <= 60
            If GetOwningQuest().GetStageDone(25) == 1 && GetOwningQuest().GetStageDone(50) == 0

                Scene MS14HelgiCoffinScene = Game.GetFormFromFile( 0x00029545, "Skyrim.esm" ) as Scene

                MS14HelgiCoffinScene.Start()
                GetOwningQuest().SetStage(50)
            EndIf
            If GetOwningQuest().GetStageDone(50) == 0
                GlobalVariable GameHour = Game.GetFormFromFile( 0x00000038, "Skyrim.esm" ) as GlobalVariable

                If GameHour.Value >= 20 || GameHour.Value <= 6
                    Scene MS14HelgiLaeletteNotDead = Game.GetFormFromFile( 0x00036652, "Skyrim.esm" ) as Scene

                    MS14HelgiLaeletteNotDead.Start()
                EndIf
            EndIf
        EndIf
    EndIf
EndEvent
