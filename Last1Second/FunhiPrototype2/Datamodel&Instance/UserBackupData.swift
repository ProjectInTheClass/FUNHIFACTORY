//
//  UserBackupData.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/03/19.
//

import Foundation

//백업본, 원본

func initializePlayer(paraPlayer : inout User)
{
    for index in paraPlayer.currentEpisodes.indices {
        initializeEpisode(target: &paraPlayer.currentEpisodes[index])
    }
    for index in paraPlayer.currentAchievementInfo.indices {
        paraPlayer.currentAchievementInfo[index].isLocked = true
    }
    paraPlayer.currentEpisodes[0].isStarted = false
    paraPlayer.currentEpisodes[0].currentCharacterNote[0].isLocked = false
    paraPlayer.currentEpisodes[0].currentCharacterNote[2].isLocked = false
    paraPlayer.dayIndex = 0
    paraPlayer.dayId = "prologue"
    paraPlayer.currentChatId = "001"
    paraPlayer.currentChatArray.removeAll()
    
}

func initializeEpisode(target : inout Episode){
    target.isCleared = false
    target.isStarted = false
    target.chatHistory = []
    target.currentStoryBlockIndex = "001"
    for index in target.currentCharacterNote.indices {
        target.currentCharacterNote[index].isLocked = true
    }
    for index in target.currentCaseNote.indices {
        target.currentCaseNote[index].isLocked = true
    }
    for index in target.currentAlbumImages.indices {
        target.currentAlbumImages[index].isLocked = true
    }
    for index in target.timelineCheckPoint.indices {
        for j in target.timelineCheckPoint[index].indices {
            target.timelineCheckPoint[index][j].isLocked = true
        }
    }
}

//초기화 되었는지 내부를 체크해보는 로직
//print("\n\n\n\n\n")
//for hi in player.currentAchievementInfo {
//    print(hi.isLocked)
//}
//for hi in player.currentEpisodes {
//    for bye in hi.currentCharacterNote {
//        print(bye.isLocked)
//    }
//    for bye in hi.currentCaseNote {
//        print(bye.isLocked)
//    }
//    for bye in hi.currentAlbumImages {
//        print(bye.isLocked)
//    }
//    for bye in hi.timelineCheckPoint {
//        for ji in bye{
//            print(ji.isLocked)
//        }
//    }
//}
//print("\n\n\n\n\n")
