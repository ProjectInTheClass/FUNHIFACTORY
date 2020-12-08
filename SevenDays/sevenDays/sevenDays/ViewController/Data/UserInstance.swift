//
//  UserInstance.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/30.
//

import Foundation

let dummyData = Data(stories: [day0, day1], histories: [.lastMemories, .runawayGirl, .thePatronsConcerns, .theTestBegins], achivements: [.charonsInterrogation, .firstComradeArgo, .likeAWelllAgedWhiskey, .whereIBelong], FullGameCharactersInfo: currentCharactersInfo)

let currentUserData = User(setting: Setting(langueage: .Korean, bgmVolume: 0.0, effectVolume: 0.0, textSpeed: 1.0), tickets: 0, currentHistories: [.lastMemories,.runawayGirl], currentAchievements:[.charonsInterrogation,.firstComradeArgo], currentGameCharacter: [:])
