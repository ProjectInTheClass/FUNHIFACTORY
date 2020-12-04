//
//  UserInstance.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/30.
//

import Foundation


var player = User(setting: playerSetting, tickets: 0, currentHistories: [], currentAchievements: [], currentGameCharacter: currentCharactersInfo, dayIndex: 0, currentChatId: "000")
var playerSetting = Setting(langueage: .Korean, bgmVolume: 0.0, effectVolume: 0.0, textSpeed: 0.1)

let dummyData = Data(stories: [day0,day1], histories: [.lastMemories, .runawayGirl, .thePatronsConcerns, .theTestBegins], achivements: [.charonsInterrogation, .firstComradeArgo, .likeAWelllAgedWhiskey, .whereIBelong], FullGameCharactersInfo: currentCharactersInfo) // currentCharatersInfo는 임시로 넣어놓은 것. 나중에 모든 캐릭터 정보 넣어야함.
