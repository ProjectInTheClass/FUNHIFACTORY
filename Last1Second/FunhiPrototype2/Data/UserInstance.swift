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
        Achievement(name: "돈화문", image: "prologue image 1", id: .donhwamun , isLocked: true),
        Achievement(name: "금천교", image: "prologue image 2", id: .geumcheongyo , isLocked: true),
        Achievement(name: "인정전", image: "prologue image 3", id:  .injeongjeon, isLocked: true),
        Achievement(name: "루스", image: "leedanheeBackground", id: .cat , isLocked: true),
        Achievement(name: "휘령의 목걸이", image: "prologue image 4", id: .necklace , isLocked: true),
        Achievement(name: "의심 속 믿음", image: "leedanheeBackground", id: .faith , isLocked: true)],
    dayIndex: 0, dayId: "day0", currentChatId: "014", currentChatArray: [])

var playerSetting = Setting(bgmVolume: 0.0, effectVolume: 0.5, textSpeed: 1.0, darkmode: false, vibration: true)

//var dummyData = GameData(stories: ["prologue":prologueChapter,"1592":chapter1,"1623":chapter2,"1919":chapter3, "2003":chapter4, "ending":endingChapter], histories: ["1":NoteCase(id: .case101, title: "", shortDescription: "", longDescription: "", isLocked: true)], achivements: [:] )

var timer:Timer!

func strToIndex(str : String) -> Int
{
    switch str {
    case "prologue":
        return 0
    case "1592":
        return 1
    case "1623":
        return 2
    case "1919":
        return 3
    case "2003":
        return 4
    case "ending":
        return 5
    default:
        return 0
    }
}

