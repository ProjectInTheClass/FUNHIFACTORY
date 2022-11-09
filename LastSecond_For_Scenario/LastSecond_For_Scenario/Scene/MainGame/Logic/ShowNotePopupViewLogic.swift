//
//  notePopupView.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/04/07.
//

import Foundation
import UIKit


var isNotePopupAnimationRunning: Bool = false

// MARK: Achievement
extension MainGameViewController {
  
  func checkAchievementInChoice(choiceIndex: Int) {
    let currentChoice = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[choiceIndex]
    guard let currentChoiceOptionalOption = currentChoice.optionalOption else { return }
    let currentChoiceAchievement = currentChoiceOptionalOption.achievementToUnlock
    
    if currentChoiceAchievement != nil {
      for achievement in player.currentAchievementInfo.enumerated() {
        if achievement.element.id == currentChoiceAchievement {
          player.currentAchievementInfo[achievement.offset].isLocked = false
          player.currentAchievementInfo[achievement.offset].isLocked = false
          print("업적 '\(player.currentAchievementInfo[achievement.offset].name)' 달성됨")
            player.currentAchievementInfo[achievement.offset].isChecked = false
          let achievementPopupInfo = ("업적", player.currentAchievementInfo[achievement.offset].name)
          notePopupItemArray.append(achievementPopupInfo)
        }
      }
    }
  }
  
  func checkAchievementInChat() {
    let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
    let currentChatAchievement = currentChatOptionalOption.achievementToUnlock
    // 팝업에 띄울 게 있다면
    if currentChatAchievement != nil {
      for achievement in player.currentAchievementInfo.enumerated() {
        if achievement.element.id == currentChatAchievement {
          player.currentAchievementInfo[achievement.offset].isLocked = false
            player.currentAchievementInfo[achievement.offset].isChecked = false
          print("업적 '\(player.currentAchievementInfo[achievement.offset].name)' 달성됨")
            
          let achievementPopupInfo = ("업적", player.currentAchievementInfo[achievement.offset].name)
          notePopupItemArray.append(achievementPopupInfo)
        }
      }
    }
  }
}

// MARK: Note
extension MainGameViewController {
  
  func checkGameCharacterInChoice(choiceIndex: Int) {
    let currentChoice = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[choiceIndex]
    guard let currentChoiceOptionalOption = currentChoice.optionalOption else { return }
    let currentChatGameCharacter = currentChoiceOptionalOption.gameCharacterToUnlock
    
    if let currentChatGameCharacter = currentChatGameCharacter {
      for gameCharacter in currentEpisode().currentCharacterNote.enumerated() {
        if gameCharacter.element.name == currentChatGameCharacter.info().name {
          currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked = false
          currentEpisode().currentCharacterNote[gameCharacter.offset].isChecked = false
          print("캐릭터 '\(currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked)' 해금됨")
          let gameCharacterPopupInfo = ("수첩 - 인물", currentEpisode().currentCharacterNote[gameCharacter.offset].name )
          notePopupItemArray.append(gameCharacterPopupInfo)
        }
      }
    }
  }
  
  func checkCaseInChoice(choiceIndex: Int) {
    let currentChoice = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[choiceIndex]
    guard let currentChoiceOptionalOption = currentChoice.optionalOption else { return }
    let currentChatCase = currentChoiceOptionalOption.caseToUnlock
    
    if currentChatCase != nil {
      for caseNote in currentEpisode().currentCaseNote.enumerated() {
        if caseNote.element.id == currentChatCase {
          currentEpisode().currentCaseNote[caseNote.offset].isLocked = false
          currentEpisode().currentCaseNote[caseNote.offset].isChecked = false
          print("사건 노트 '\(currentEpisode().currentCaseNote[caseNote.offset].isLocked)' 해금됨")
         
          let casePopupInfo = ("수첩 - 사건", currentEpisode().currentCaseNote[caseNote.offset].title )
          notePopupItemArray.append(casePopupInfo)
        }
      }
    }
  }
  
  //mainGame에서 currentChat 정보 읽어서 알맞는 등장인물의 infomation 해금하기
  func checkgameCharacterInfomationInChoice(choiceIndex: Int) {
    let currentChoice = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[choiceIndex]
    guard let currentChoiceOptionalOption = currentChoice.optionalOption else { return }
    let currentChatInfomation = currentChoiceOptionalOption.infomationToUnlock
    
    if currentChatInfomation != nil {
      for gameCharacter in currentEpisode().currentCharacterNote.enumerated() {
        for infomation in gameCharacter.element.infomation.enumerated() {
          if infomation.element.infomationID == currentChatInfomation {
            currentEpisode().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked = false
            print("'\(currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked)' 정보 해금됨")
            let gameCharacterInfomationInfo = ("수첩 - 인물 정보", currentEpisode().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].text )
            notePopupItemArray.append(gameCharacterInfomationInfo)
          }
        }
      }
    }
  }
  
  func checkGameCharacterInChat() {
    let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
    let currentChatGameCharacter = currentChatOptionalOption.gameCharacterToUnlock
    
    if let currentChatGameCharacter = currentChatGameCharacter {
      for gameCharacter in currentEpisode().currentCharacterNote.enumerated() {
        if gameCharacter.element.name == currentChatGameCharacter.info().name {
          currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked = false
          currentEpisode().currentCharacterNote[gameCharacter.offset].isChecked = false
          print("캐릭터 '\(currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked)' 해금됨")
    
          let gameCharacterPopupInfo = ("수첩 - 인물", currentEpisode().currentCharacterNote[gameCharacter.offset].name )
          notePopupItemArray.append(gameCharacterPopupInfo)
        }
      }
    }
  }

  //mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 사건 금하기
  func checkCaseInChat() {
    let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
    let currentChatCase = currentChatOptionalOption.caseToUnlock
    
    if currentChatCase != nil {
      for caseNote in currentEpisode().currentCaseNote.enumerated() {
        if caseNote.element.id == currentChatCase {
          currentEpisode().currentCaseNote[caseNote.offset].isLocked = false
          currentEpisode().currentCaseNote[caseNote.offset].isChecked = false
          print("사건 노트 '\(currentEpisode().currentCaseNote[caseNote.offset].isLocked)' 해금됨")
         
          let casePopupInfo = ("수첩 - 사건", currentEpisode().currentCaseNote[caseNote.offset].title )
          notePopupItemArray.append(casePopupInfo)
        }
      }
    }
  }

  //mainGame에서 currentChat 정보 읽어서 알맞는 등장인물의 infomation 해금하기
  func checkgameCharacterInfomationInChat() {
    let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
    let currentChatInfomation = currentChatOptionalOption.infomationToUnlock
    
    if currentChatInfomation != nil {
      for gameCharacter in currentEpisode().currentCharacterNote.enumerated() {
        for infomation in gameCharacter.element.infomation.enumerated() {
          if infomation.element.infomationID == currentChatInfomation {
            currentEpisode().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked = false
            print("'\(currentEpisode().currentCharacterNote[gameCharacter.offset].isLocked)' 정보 해금됨")
          
            let gameCharacterInfomationInfo = ("수첩 - 인물 정보", currentEpisode().currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].text )
            notePopupItemArray.append(gameCharacterInfomationInfo)
          }
        }
      }
    }
  }
}


// MARK: Album
extension MainGameViewController {
  
  func checkAlbumImageInChoice(choiceIndex: Int) {
    let currentChoice = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[choiceIndex]
    guard let currentChoiceOptionalOption = currentChoice.optionalOption else { return }
    let currentChatAlbumImage = currentChoiceOptionalOption.albumImageToUnlock
    
    if currentChatAlbumImage != nil {
      for albumImage in currentEpisode().currentAlbumImages.enumerated() {
        if albumImage.element.id == currentChatAlbumImage {
          currentEpisode().currentAlbumImages[albumImage.offset].isLocked = false
          currentEpisode().currentAlbumImages[albumImage.offset].isChecked = false
          print("'\(currentEpisode().currentAlbumImages[albumImage.offset].isLocked)' 앨범 이미지 해금됨")
        
          let albumImageInfo = ("앨범", currentEpisode().currentAlbumImages[albumImage.offset].title )
          notePopupItemArray.append(albumImageInfo)
        }
      }
    }
  }
  
  func checkAlbumImageInChat() {
      let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
      guard let currentChatOptionalOption = currentChat.optionalOption else { return }
      let currentChatAlbumImage = currentChatOptionalOption.albumImageToUnlock
      
      if currentChatAlbumImage != nil {
        for albumImage in currentEpisode().currentAlbumImages.enumerated() {
          if albumImage.element.id == currentChatAlbumImage {
            currentEpisode().currentAlbumImages[albumImage.offset].isLocked = false
            currentEpisode().currentAlbumImages[albumImage.offset].isChecked = false
            print("'\(currentEpisode().currentAlbumImages[albumImage.offset].isLocked)' 앨범 이미지 해금됨")
          
            let albumImageInfo = ("앨범", currentEpisode().currentAlbumImages[albumImage.offset].title )
            notePopupItemArray.append(albumImageInfo)
          }
        }
      }
    }
  }

// MARK: Checkpoint
extension MainGameViewController {
  
  func checkCheckPointInChat() {
    let currentChat = currentEpisode().storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.chats[player.indexNumber]
    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
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
}
