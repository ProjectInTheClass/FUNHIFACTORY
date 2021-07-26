//
//  notePopupView.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/04/07.
//

import Foundation
import UIKit


var isNotePopupAnimationRunning: Bool = false


extension mainGameViewController {



    //mainGame에서 currentChat 정보 읽어서 알맞는 주인공 업적 해금하기
    func checkAchievementInChoice(choiceIndex: Int) {
        let currentChoice = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[choiceIndex]
        guard let currentChoiceOptionalOption = currentChoice.optionalOption else {
            return
        }
        let currentChoiceAchievement = currentChoiceOptionalOption.achievementToUnlock
        if currentChoiceAchievement != nil {
            for achievement in player.currentAchievementInfo.enumerated() {
                if achievement.element.id == currentChoiceAchievement {
                    player.currentAchievementInfo[achievement.offset].isLocked = false
                    print("업적 '\(player.currentAchievementInfo[achievement.offset].name)' 달성됨")
                    buttonAlertOn(input: 0)
                    let achievementPopupInfo = ("업적", player.currentAchievementInfo[achievement.offset].name)
                    notePopupItemArray.append(achievementPopupInfo)
                    
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 등장인물 해금하기
    func checkGameCharacterInChoice(choiceIndex: Int) {
        
        let currentChoice = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[choiceIndex]
        guard let currentChoiceOptionalOption = currentChoice.optionalOption else {
            return
        }
        let currentChatGameCharacter = currentChoiceOptionalOption.gameCharacterToUnlock
        
        if let currentChatGameCharacter = currentChatGameCharacter {
            for gameCharacter in currentEpisode().currentCharacterNote.enumerated() {
                if gameCharacter.element.name == currentChatGameCharacter.info().name {
                    currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked = false
                    print("캐릭터 '\(currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked)' 해금됨")
                    buttonAlertOn(input: 0)
                    let gameCharacterPopupInfo = ("수첩 - 인물", currentEpisode().currentCharacterNote[gameCharacter.offset].name )
                    notePopupItemArray.append(gameCharacterPopupInfo)
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 사건 금하기
    func checkCaseInChoice(choiceIndex: Int) {
        
        let currentChoice = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[choiceIndex]
        guard let currentChoiceOptionalOption = currentChoice.optionalOption else {
            return
        }
        let currentChatCase = currentChoiceOptionalOption.caseToUnlock
        
        if currentChatCase != nil {
            for caseNote in currentEpisode().currentCaseNote.enumerated() {
                if caseNote.element.id == currentChatCase {
                    currentEpisode().currentCaseNote[caseNote.offset].isLocked = false
                    print("사건 노트 '\(currentEpisode().currentCaseNote[caseNote.offset].isLocked)' 해금됨")
                    buttonAlertOn(input: 0)
                    let casePopupInfo = ("수첩 - 사건", currentEpisode().currentCaseNote[caseNote.offset].title )
                    notePopupItemArray.append(casePopupInfo)
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞는 등장인물의 infomation 해금하기
    func checkgameCharacterInfomationInChoice(choiceIndex: Int) {
        
        let currentChoice = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[choiceIndex]
        guard let currentChoiceOptionalOption = currentChoice.optionalOption else {
            return
        }
        
        let currentChatInfomation = currentChoiceOptionalOption.infomationToUnlock
        
        if currentChatInfomation != nil {
            for gameCharacter in currentEpisode().currentCharacterNote.enumerated() {
                for infomation in gameCharacter.element.infomation.enumerated() {
                    if infomation.element.infomationID == currentChatInfomation {
                        currentEpisode().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked = false
                        print("'\(currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked)' 정보 해금됨")
                        buttonAlertOn(input: 0)
                        let gameCharacterInfomationInfo = ("수첩 - 인물 정보", currentEpisode().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].text )
                        notePopupItemArray.append(gameCharacterInfomationInfo)
                    }
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞은 앨범 이미지 해금하기
    func checkAlbumImageInChoice(choiceIndex: Int) {
        
        let currentChoice = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[choiceIndex]
        guard let currentChoiceOptionalOption = currentChoice.optionalOption else {
            return
        }
        let currentChatAlbumImage = currentChoiceOptionalOption.albumImageToUnlock
        
        if currentChatAlbumImage != nil {
            for albumImage in currentEpisode().currentAlbumImages.enumerated() {
                if albumImage.element.id == currentChatAlbumImage {
                    currentEpisode().currentAlbumImages[albumImage.offset].isLocked = false
                    print("'\(currentEpisode().currentAlbumImages[albumImage.offset].isLocked)' 앨범 이미지 해금됨")
                    buttonAlertOn(input: 1)
                    let albumImageInfo = ("앨범", currentEpisode().currentAlbumImages[albumImage.offset].title )
                    notePopupItemArray.append(albumImageInfo)
                }
            }
        }
    }

    //------------------------------------------------------------------------------------------------------------

    // 타입 : (String, String)
    //mainGame에서 currentChat 정보 읽어서 알맞는 주인공 업적 해금하기

        func checkAchievementInChat() {
           
            
            let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
            guard let currentChatOptionalOption = currentChat.optionalOption else {
                return
            }
            let currentChatAchievement = currentChatOptionalOption.achievementToUnlock
            
            
            // 팝업에 띄울 게 있다면
            if currentChatAchievement != nil {
                for achievement in player.currentAchievementInfo.enumerated() {
                    if achievement.element.id == currentChatAchievement {
                        player.currentAchievementInfo[achievement.offset].isLocked = false
                        print("업적 '\(player.currentAchievementInfo[achievement.offset].name)' 달성됨")
                        buttonAlertOn(input: 0)
                        let achievementPopupInfo = ("업적", player.currentAchievementInfo[achievement.offset].name)
                        notePopupItemArray.append(achievementPopupInfo)
                    }
                }
            }
        }

 

    //mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 등장인물 해금하기
    func checkGameCharacterInChat() {
     
        let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
        guard let currentChatOptionalOption = currentChat.optionalOption else {
            return
        }
        let currentChatGameCharacter = currentChatOptionalOption.gameCharacterToUnlock
        
        if let currentChatGameCharacter = currentChatGameCharacter {
            for gameCharacter in currentEpisode().currentCharacterNote.enumerated() {
                if gameCharacter.element.name == currentChatGameCharacter.info().name {
                    currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked = false
                    print("캐릭터 '\(currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked)' 해금됨")
                    buttonAlertOn(input: 0)
                    let gameCharacterPopupInfo = ("수첩 - 인물", currentEpisode().currentCharacterNote[gameCharacter.offset].name )
                    notePopupItemArray.append(gameCharacterPopupInfo)
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 사건 금하기
    func checkCaseInChat() {
        let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
        guard let currentChatOptionalOption = currentChat.optionalOption else {
            return
        }
        let currentChatCase = currentChatOptionalOption.caseToUnlock
        if currentChatCase != nil {
            for caseNote in currentEpisode().currentCaseNote.enumerated() {
                if caseNote.element.id == currentChatCase {
                    currentEpisode().currentCaseNote[caseNote.offset].isLocked = false
                    print("사건 노트 '\(currentEpisode().currentCaseNote[caseNote.offset].isLocked)' 해금됨")
                    buttonAlertOn(input: 0)
                    let casePopupInfo = ("수첩 - 사건", currentEpisode().currentCaseNote[caseNote.offset].title )
                    notePopupItemArray.append(casePopupInfo)
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞는 등장인물의 infomation 해금하기
    func checkgameCharacterInfomationInChat() {
        let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
        guard let currentChatOptionalOption = currentChat.optionalOption else {
            return
        }
        let currentChatInfomation = currentChatOptionalOption.infomationToUnlock
        if currentChatInfomation != nil {
            for gameCharacter in currentEpisode().currentCharacterNote.enumerated() {
                for infomation in gameCharacter.element.infomation.enumerated() {
                    if infomation.element.infomationID == currentChatInfomation {
                        currentEpisode().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked = false
                        print("'\(currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked)' 정보 해금됨")
                        buttonAlertOn(input: 0)
                        let gameCharacterInfomationInfo = ("수첩 - 인물 정보", currentEpisode().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].text )
                        notePopupItemArray.append(gameCharacterInfomationInfo)

                    }
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞은 앨범 이미지 해금하기
    func checkAlbumImageInChat() {
        let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
        guard let currentChatOptionalOption = currentChat.optionalOption else {
            return
        }
        let currentChatAlbumImage = currentChatOptionalOption.albumImageToUnlock
        
        if currentChatAlbumImage != nil {
       
            for albumImage in currentEpisode().currentAlbumImages.enumerated() {
                if albumImage.element.id == currentChatAlbumImage {
                    currentEpisode().currentAlbumImages[albumImage.offset].isLocked = false
                    print("'\(currentEpisode().currentAlbumImages[albumImage.offset].isLocked)' 앨범 이미지 해금됨")
                    buttonAlertOn(input: 1)
                    let albumImageInfo = ("앨범", currentEpisode().currentAlbumImages[albumImage.offset].title )
                    notePopupItemArray.append(albumImageInfo)
            
                }
            }
        }
    }
}

//mainGame에서 currentChat 정보 읽어서 알맞은 체크포인트 해금하기
func checkCheckPointInChat() {
    let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
    guard let currentChatOptionalOption = currentChat.optionalOption else {
        return
    }
    let currentChatCheckPoint = currentChatOptionalOption.checkPointToUnlock

    if currentChatCheckPoint != nil {

        for checkPointSection in currentEpisode().timelineCheckPoint.enumerated() {
            for checkPoint in checkPointSection.element.enumerated() {
                if checkPoint.element.id == currentChatCheckPoint {
                    player.currentEpisodes[player.dayIndex].timelineCheckPoint[checkPointSection.offset][checkPoint.offset].isLocked = false
                    print("'\(player.currentEpisodes[player.dayIndex].timelineCheckPoint[checkPointSection.offset][checkPoint.offset].name): 해금\(!player.currentEpisodes[player.dayIndex].timelineCheckPoint[checkPointSection.offset][checkPoint.offset].isLocked)임' 앨범 이미지 해금됨")

                }
            }
        }
    }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//func notePopupViewDesign(notePopupView: UIView, backgroundView: UIView, titleLabel: UILabel, descriptionLabel: UILabel, descriptionText: String, infoID: String) {
//    //-----------------------팝업 constraint---------------------------
//    notePopupView.translatesAutoresizingMaskIntoConstraints = false
//    notePopupView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: -53).isActive = true
//        let horizontalConstraint = NSLayoutConstraint(item: notePopupView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: backgroundView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
//        let widthConstraint = NSLayoutConstraint(item: notePopupView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 231)
//        let heightConstraint = NSLayoutConstraint(item: notePopupView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 53)
//    backgroundView.addConstraints([horizontalConstraint, widthConstraint, heightConstraint])
    //-----------------------------------------------------
    
//    for _ in 0...popupInfoTupleArray.count {
//        //팝업 띄우는 애니메이션
//        titleLabel.text = "업적"
//        descriptionLabel.text = "\(descriptionText) 획득"
//    }
//
//    if infoID == "gameCharacter" {
//        titleLabel.text = "수첩 - 인물"
//        descriptionLabel.text = "\(descriptionText) 정보 획득"
//    }
//    if infoID == "case" {
//        titleLabel.text = "수첩 - 역사"
//        descriptionLabel.text = "\(descriptionText) 정보 획득"
//    }
//    if infoID == "characterInfomation" {
//        titleLabel.text = "수첩 - 인물"
//        descriptionLabel.text = "\(descriptionText) 획득"
//    }
//
//}
