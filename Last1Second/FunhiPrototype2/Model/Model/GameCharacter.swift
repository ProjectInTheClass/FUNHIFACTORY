//
//  GameCharacter.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

// gameCharacter는 참조 기능 필요해서 class임
class GameCharacter: Codable {
  var name: String
  var profileImage: String
  var backGroundImage : String
  var description: String
  var infomation: [Infomation]
  var isLocked: Bool
  var isChecked: Bool = true
    
  init(name: String, profileImage: String ,backGroundImage: String, description: String, infomation: [Infomation], isLocked: Bool, isChecked: Bool) {
    self.name = name
    self.profileImage = profileImage
    self.backGroundImage = backGroundImage
    self.description = description
    self.infomation = infomation
    self.isLocked = isLocked
    self.isChecked = isChecked
  }
}

enum GameCharacterID: String,Codable {
  case danhee
  case hwiryeong
  case tourguide
  case teacher
  case danhee2
  case extra1
  case extra2
  case extra3
  case extra4
  case igwi
  case kimman
  case kimwoman
  case poorman
  case everyone
  case injo
  case currentEpDanhee
    
  func info() -> GameCharacter{
    switch self {
    case .currentEpDanhee:
      return currentMainGameDanhee().info()
    case .danhee:
      return player.currentEpisodes[0].currentCharacterNote[0]
    case .hwiryeong:
      return player.currentEpisodes[0].currentCharacterNote[1]
    case .tourguide:
      return player.currentEpisodes[0].currentCharacterNote[2]
    case .teacher:
      return player.currentEpisodes[0].currentCharacterNote[3]
    case .danhee2:
      return player.currentEpisodes[2].currentCharacterNote[0]
    case .igwi:
      return  player.currentEpisodes[2].currentCharacterNote[1]
    case .kimman:
      return player.currentEpisodes[2].currentCharacterNote[2]
    case .kimwoman:
      return player.currentEpisodes[2].currentCharacterNote[3]
    case .poorman:
      return player.currentEpisodes[2].currentCharacterNote[4]
    case .injo:
      return player.currentEpisodes[2].currentCharacterNote[5]
    case .everyone:
      return extraCharacters[0]
    case .extra1:
      return extraCharacters[1]
    case .extra2:
      return extraCharacters[2]
    case .extra3:
      return extraCharacters[3]
    case .extra4:
      return extraCharacters[4]
    }
  }
}

enum CharacterFace: String, Codable {
  case none
  case angry1
  case angry2
  case angry3
  case angry4
  case basic
  case cry1
  case cry2
  case happy1
  case happy2
  case happy3
  case sad
  case scared
  case straight
  case surprise1
  case surprise2
  case basictalk
  case cryangry1
  case cryangry2
  case thanks
  case danger
  case happytalk
}
