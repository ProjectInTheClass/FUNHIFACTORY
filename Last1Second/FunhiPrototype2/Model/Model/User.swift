//
//  User.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

struct User: Codable {
  var setting: Setting
  var currentEpisodes: [Episode]
  var currentAchievementInfo: [Achievement]
  var clearedAchievementCount: Int {
    get {
      var cleardCount = Int()
      for achievement in self.currentAchievementInfo {
        if !achievement.isLocked {
          cleardCount += 1
        }
      }
      return cleardCount
    }
  }
  //이 아래 두 개 역할이 어떻게 되고 어떤 차이점이 있는지 주석으로 설명 부탁합니다 궁금22
  var dayIndex: Int
  var dayId: String {
    didSet {
      print("dayID 바뀜: \(self.dayId)")
    }
  }
  var currentChatId: String
  var currentChatArray: [Chat]
  var indexNumber = 0
}
