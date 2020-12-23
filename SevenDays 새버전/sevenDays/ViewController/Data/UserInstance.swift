//
//  UserInstance.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/30.
//

import Foundation
import AVFoundation

// 2번 뷰에서 사용할 브금 플레이어
var audioPlayer: AVAudioPlayer?
var minimumTextSpeed = 3.5
var maximumTextSpeed = 0.85
// 3번(메인게임) 뷰에서 사용하는 타이머
var timer:Timer!

var player = User(setting: playerSetting, tickets: 0, currentHistories: [.lastMemories, .runawayGirl, .thePatronsConcerns, .theTestBegins], currentAchievements: [.charonsInterrogation, .firstComradeArgo, .likeAWelllAgedWhiskey, .whereIBelong], currentGameCharacter: currentCharactersInfo, dayIndex: 0, dayId: "day0", currentChatId: "096")
var playerSetting = Setting(langueage: .Korean, bgmVolume: 0.5, effectVolume: 0.0, textSpeed: 10.0)

let dummyData = GameData(stories: ["day0":test1,"day1":day1],
                     histories: [.lastMemories, .runawayGirl, .thePatronsConcerns, .theTestBegins],
                     achivements: [.charonsInterrogation, .firstComradeArgo, .likeAWelllAgedWhiskey, .whereIBelong],
                     FullGameCharactersInfo: currentCharactersInfo) // currentCharatersInfo는 임시로 넣어놓은 것. 나중에 모든 캐릭터 정보 넣어야함.
