//
//  UserInstance.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/30.
//

import Foundation
import AVFoundation


var player = User(
    setting: playerSetting,
    currentEpisodes: [prologueChapter,chapter1,chapter2,chapter3,chapter4,endingChapter],
    currentAchievementInfo: [
        Achievement(name: "돈화문", image: "donhwamun", id: .donhwamun , isLocked: false),
        Achievement(name: "금천교", image: "geumcheongyo", id: .geumcheongyo , isLocked: false),
        Achievement(name: "인정전", image: "injeongjeon", id:  .injeongjeon, isLocked: false),
        Achievement(name: "루스", image: "cat", id: .cat , isLocked: false),
        Achievement(name: "휘령의 목걸이", image: "necklace_0", id: .necklace_0 , isLocked: false),
        Achievement(name: "기억 속의 부모님", image: "Parents", id: .parents , isLocked: false),
        Achievement(name: "거짓말쟁이", image: "liar", id: .liar , isLocked: false),
        Achievement(name: "희정당", image: "huijeongdang", id: .huijeongdang , isLocked: false),
        Achievement(name: "후원", image: "huwon_garden", id: .huwon_garden , isLocked: false),
        Achievement(name: "반란군", image: "revolt", id: .revolt , isLocked: false)],
    dayIndex: 0, dayId: "prologue", currentChatId: "014", currentChatArray: [])

var playerSetting = Setting(bgmVolume: 0.0, effectVolume: 0.5, textSpeed: 1.0, darkmode: false, vibration: true)

var timer:Timer!
