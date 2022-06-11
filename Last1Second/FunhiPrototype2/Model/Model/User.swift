//
//  User.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation
import RealityKit

struct User: Codable {
  var setting: Setting
  var currentEpisodes: [Episode]
  var currentAchievementInfo: [Achievement]
  
  var clearedAchievementCount: Int {
    get {
      return currentAchievementInfo.filter { !$0.isLocked }.count
    }
  }
  //이 아래 두 개 역할이 어떻게 되고 어떤 차이점이 있는지 주석으로 설명 부탁합니다 궁금22
  var dayIndex: Int
  var dayId: String {
    didSet { print("dayID 바뀜: \(self.dayId)") }
  }
  var currentChatId: String
  var currentChatArray: [Chat]
  var indexNumber = 0
  
  var userStore: TutorialManager
}

class TutorialManager: Codable {
  
  var isMainGameTutorialOpened: Bool = false
  var isNoteTutorialOpened: Bool = false
  var isAlbumTutorialOpened: Bool = false
  var isTimelineTutorialOpened: Bool = false
  var isHomeTutorialOpened: Bool = false
  var isMapTutorialOpened: Bool = false
  
  var isTitleCoverViewReleaseAlertOpened: Bool = false
  
  var isGameRestarted: Bool = false
}
