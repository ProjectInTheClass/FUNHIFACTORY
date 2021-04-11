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
        let currentChoice = currentDay().storyBlocks[player.currentChatId]!.choices[choiceIndex]
        guard let currentChoiceOptionalOption = currentChoice.optionalOption else {
            return
        }
        let currentChoiceAchievement = currentChoiceOptionalOption.achievementToUnlock
        if currentChoiceAchievement != nil {
            for achievement in player.currentAchievementInfo.enumerated() {
                if achievement.element.id == currentChoiceAchievement {
                    player.currentAchievementInfo[achievement.offset].isLocked = false
                    print("업적 '\(player.currentAchievementInfo[achievement.offset].name)' 달성됨")
                 
                    let achievementPopupInfo = ("업적", player.currentAchievementInfo[achievement.offset].name)
                    notePopupItemArray.append(achievementPopupInfo)
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 등장인물 해금하기
    func checkGameCharacterInChoice(choiceIndex: Int) {
        
        let currentChoice = currentDay().storyBlocks[player.currentChatId]!.choices[choiceIndex]
        guard let currentChoiceOptionalOption = currentChoice.optionalOption else {
            return
        }
        let currentChatGameCharacter = currentChoiceOptionalOption.gameCharacterToUnlock
        
        if let currentChatGameCharacter = currentChatGameCharacter {
            for gameCharacter in currentDay().currentCharacterNote.enumerated() {
                if gameCharacter.element.name == currentChatGameCharacter.info().name {
                    currentDay().currentCharacterNote[gameCharacter.offset].isLocked = false
                    print("캐릭터 '\(currentDay().currentCharacterNote[gameCharacter.offset].isLocked)' 해금됨")
                    
                    let gameCharacterPopupInfo = ("수첩 - 인물", currentDay().currentCharacterNote[gameCharacter.offset].name )
                    notePopupItemArray.append(gameCharacterPopupInfo)
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 사건 금하기
    func checkCaseInChoice(choiceIndex: Int) {
        
        let currentChoice = currentDay().storyBlocks[player.currentChatId]!.choices[choiceIndex]
        guard let currentChoiceOptionalOption = currentChoice.optionalOption else {
            return
        }
        let currentChatCase = currentChoiceOptionalOption.caseToUnlock
        
        if currentChatCase != nil {
            for caseNote in currentDay().currentCaseNote.enumerated() {
                if caseNote.element.id == currentChatCase {
                    currentDay().currentCaseNote[caseNote.offset].isLocked = false
                    print("사건 노트 '\(currentDay().currentCaseNote[caseNote.offset].isLocked)' 해금됨")
                    
                    let casePopupInfo = ("수첩 - 사건", currentDay().currentCaseNote[caseNote.offset].title )
                    notePopupItemArray.append(casePopupInfo)
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞는 등장인물의 infomation 해금하기
    func checkgameCharacterInfomationInChoice(choiceIndex: Int) {
        
        let currentChoice = currentDay().storyBlocks[player.currentChatId]!.choices[choiceIndex]
        guard let currentChoiceOptionalOption = currentChoice.optionalOption else {
            return
        }
        let currentChatInfomation = currentChoiceOptionalOption.infomationToUnlock
        
        if currentChatInfomation != nil {
            for gameCharacter in currentDay().currentCharacterNote.enumerated() {
                for infomation in gameCharacter.element.infomation.enumerated() {
                    if infomation.element.infomationID == currentChatInfomation {
                        currentDay().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked = false
                        print("'\(currentDay().currentCharacterNote[gameCharacter.offset].isLocked)' 정보 해금됨")
                        
                        let gameCharacterInfomationInfo = ("수첩 - 인물 정보", currentDay().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].text )
                        notePopupItemArray.append(gameCharacterInfomationInfo)
                    }
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞은 앨범 이미지 해금하기
    func checkAlbumImageInChoice(choiceIndex: Int) {
        
        let currentChoice = currentDay().storyBlocks[player.currentChatId]!.choices[choiceIndex]
        guard let currentChoiceOptionalOption = currentChoice.optionalOption else {
            return
        }
        let currentChatAlbumImage = currentChoiceOptionalOption.albumImageToUnlock
        
        if currentChatAlbumImage != nil {
            for albumImage in currentDay().currentAlbumImages.enumerated() {
                if albumImage.element.id == currentChatAlbumImage {
                    currentDay().currentAlbumImages[albumImage.offset].isLocked = false
                    print("'\(currentDay().currentAlbumImages[albumImage.offset].isLocked)' 앨범 이미지 해금됨")
                    
                    let albumImageInfo = ("앨범", currentDay().currentAlbumImages[albumImage.offset].title )
                    notePopupItemArray.append(albumImageInfo)
                }
            }
        }
    }

    //------------------------------------------------------------------------------------------------------------

    // 타입 : (String, String)
    //mainGame에서 currentChat 정보 읽어서 알맞는 주인공 업적 해금하기

        func checkAchievementInChat() {
           
            
            let currentChat = currentDay().storyBlocks[player.currentChatId]!.chats[player.indexNumber]
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
                        
                        let achievementPopupInfo = ("업적", player.currentAchievementInfo[achievement.offset].name)
                        notePopupItemArray.append(achievementPopupInfo)
                    }
                }
            }
        }

 

    //mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 등장인물 해금하기
    func checkGameCharacterInChat() {
     
        let currentChat = currentDay().storyBlocks[player.currentChatId]!.chats[player.indexNumber]
        guard let currentChatOptionalOption = currentChat.optionalOption else {
            return
        }
        let currentChatGameCharacter = currentChatOptionalOption.gameCharacterToUnlock
        
        if let currentChatGameCharacter = currentChatGameCharacter {
            for gameCharacter in currentDay().currentCharacterNote.enumerated() {
                if gameCharacter.element.name == currentChatGameCharacter.info().name {
                    currentDay().currentCharacterNote[gameCharacter.offset].isLocked = false
                    print("캐릭터 '\(currentDay().currentCharacterNote[gameCharacter.offset].isLocked)' 해금됨")
                    
                    let gameCharacterPopupInfo = ("수첩 - 인물", currentDay().currentCharacterNote[gameCharacter.offset].name )
                    notePopupItemArray.append(gameCharacterPopupInfo)
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 사건 금하기
    func checkCaseInChat() {
        let currentChat = currentDay().storyBlocks[player.currentChatId]!.chats[player.indexNumber]
        guard let currentChatOptionalOption = currentChat.optionalOption else {
            return
        }
        let currentChatCase = currentChatOptionalOption.caseToUnlock
        if currentChatCase != nil {
            for caseNote in currentDay().currentCaseNote.enumerated() {
                if caseNote.element.id == currentChatCase {
                    currentDay().currentCaseNote[caseNote.offset].isLocked = false
                    print("사건 노트 '\(currentDay().currentCaseNote[caseNote.offset].isLocked)' 해금됨")
          
                    
                    let casePopupInfo = ("수첩 - 사건", currentDay().currentCaseNote[caseNote.offset].title )
                    notePopupItemArray.append(casePopupInfo)
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞는 등장인물의 infomation 해금하기
    func checkgameCharacterInfomationInChat() {
        let currentChat = currentDay().storyBlocks[player.currentChatId]!.chats[player.indexNumber]
        guard let currentChatOptionalOption = currentChat.optionalOption else {
            return
        }
        let currentChatInfomation = currentChatOptionalOption.infomationToUnlock
        if currentChatInfomation != nil {
            for gameCharacter in currentDay().currentCharacterNote.enumerated() {
                for infomation in gameCharacter.element.infomation.enumerated() {
                    if infomation.element.infomationID == currentChatInfomation {
                        currentDay().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked = false
                        print("'\(currentDay().currentCharacterNote[gameCharacter.offset].isLocked)' 정보 해금됨")
                        
                        let gameCharacterInfomationInfo = ("수첩 - 인물 정보", currentDay().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].text )
                        notePopupItemArray.append(gameCharacterInfomationInfo)

                    }
                }
            }
        }
    }

    //mainGame에서 currentChat 정보 읽어서 알맞은 앨범 이미지 해금하기
    func checkAlbumImageInChat() {
        let currentChat = currentDay().storyBlocks[player.currentChatId]!.chats[player.indexNumber]
        guard let currentChatOptionalOption = currentChat.optionalOption else {
            return
        }
        let currentChatAlbumImage = currentChatOptionalOption.albumImageToUnlock
        
        if currentChatAlbumImage != nil {
       
            for albumImage in currentDay().currentAlbumImages.enumerated() {
                if albumImage.element.id == currentChatAlbumImage {
                    currentDay().currentAlbumImages[albumImage.offset].isLocked = false
                    print("'\(currentDay().currentAlbumImages[albumImage.offset].isLocked)' 앨범 이미지 해금됨")
                  
                    let albumImageInfo = ("앨범", currentDay().currentAlbumImages[albumImage.offset].title )
                    notePopupItemArray.append(albumImageInfo)
            
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
