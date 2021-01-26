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
    currentEpisodes: [prologueChapter,Chapter1,Chapter2,Chapter3,Chapter4],
    currentAchievementInfo: [
        Achievement(name: "돈화문", image: "prologue image 1", id: .donhwamun , isLocked: true),
        Achievement(name: "금천교", image: "prologue image 2", id: .geumcheongyo , isLocked: true),
        Achievement(name: "인정전", image: "prologue image 3", id:  .injeongjeon, isLocked: true),
        Achievement(name: "루스", image: "leedanheeBackground", id: .cat , isLocked: true),
        Achievement(name: "휘령의 목걸이", image: "prologue image 4", id: .necklace , isLocked: true),
        Achievement(name: "의심 속 믿음", image: "leedanheeBackground", id: .faith , isLocked: true)],
    dayIndex: 0, dayId: "day0", currentChatId: "014")

var playerSetting = Setting(bgmVolume: 0.5, effectVolume: 0.0, textSpeed: 1.0, darkmode: false)

let dummyData = GameData(stories: ["prologue":prologueChapter,"1592":Chapter1,"1623":Chapter2,"1919":Chapter3, "2003":Chapter4], histories: ["1":NoteCase(id: .case101, title: "", shortDescription: "", longDescription: "", isLocked: true)], achivements: [:])
//더미데이터에 들어간 히스토리나 업적들은 오류를 안뜨게 하기 위해서 일부러 넣어놓은 값들. 수정해도 됨.

var timer:Timer!
