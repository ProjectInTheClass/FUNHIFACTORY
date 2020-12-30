//
//  UserInstance.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/30.
//

import Foundation

var player = User(setting: playerSetting, tickets: 0, currentHistories: [.lastMemories, .runawayGirl, .thePatronsConcerns, .theTestBegins], currentAchievements: [.charonsInterrogation, .firstComradeArgo, .likeAWelllAgedWhiskey, .whereIBelong], currentGameCharacter: currentCharactersInfo, dayIndex: 0, dayId: "day0", currentChatId: "096")

var playerSetting = Setting(bgmVolume: 0.5, effectVolume: 0.0, textSpeed: 10.0)

let dummyData = GameData(stories: ["day0":test1],
                     histories: [.lastMemories, .runawayGirl, .thePatronsConcerns, .theTestBegins],
                     achivements: [.charonsInterrogation, .firstComradeArgo, .likeAWelllAgedWhiskey, .whereIBelong],
                     FullGameCharactersInfo: currentCharactersInfo)
