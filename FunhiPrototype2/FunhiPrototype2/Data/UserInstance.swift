//
//  UserInstance.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/30.
//

import Foundation
import AVFoundation




var player = User(setting: playerSetting, currentEpisodes: [prologueChapter,testChapter1,testChapter2,testChapter3,testChapter4], currentCharacterInfo: currentCharactersInfo, currentAchievementInfo: [Achievement(name: "이야기의 시작", image: "leedanheeBackground", id: .geumcheongyo , isLocked: false), Achievement(name: "???", image: "EP1LeedanheeBackground", id: .injeongjeon , isLocked: true), Achievement(name: "???", image: "EP1LeedanheeBackground", id:  .cat, isLocked: true), Achievement(name: "???", image: "leedanheeBackground", id: .achievement4 , isLocked: true) ], dayIndex: 0, dayId: "day0", currentChatId: "001")


var playerSetting = Setting(bgmVolume: 0.5, effectVolume: 0.0, textSpeed: 1.0)

let dummyData = GameData(stories: ["prologue":prologueChapter,"1592":testChapter1,"1623":testChapter2,"1919":testChapter3, "2003":testChapter4], histories: ["1":NoteCase(id: .case101, title: "", shortDescription: "", longDescription: "", isLocked: true)], achivements: [:], gameCharacters: currentCharactersInfo)
//더미데이터에 들어간 히스토리나 업적들은 오류를 안뜨게 하기 위해서 일부러 넣어놓은 값들. 수정해도 됨.

var timer:Timer!
