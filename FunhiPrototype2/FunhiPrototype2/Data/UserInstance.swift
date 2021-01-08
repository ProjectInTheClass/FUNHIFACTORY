//
//  UserInstance.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/30.
//

import Foundation

var player = User(setting: playerSetting, currentEpisodes: [prologueChapter,testChapter1,testChapter2,testChapter3,testChapter4], currentCharacterInfo: currentCharactersInfo, currentAchievementInfo: [Achievement(name: "업적1", image: "leedanheeBackground", id: .achievement1 , isLocked: true), Achievement(name: "업적2", image: "EP1LeedanheeBackground", id: .achievement2 , isLocked: true), Achievement(name: "업적3", image: "EP1LeedanheeBackground", id: .achievement3 , isLocked: true), Achievement(name: "업적4", image: "leedanheeBackground", id: .achievement4 , isLocked: true) ], dayIndex: 0, dayId: "day0", currentChatId: "003")


var playerSetting = Setting(bgmVolume: 0.5, effectVolume: 0.0, textSpeed: 1.0)

let dummyData = GameData(stories: ["prologue":prologueChapter,"1592":testChapter1], histories: ["1":NoteCase(id: .case101, title: "", shortDescription: "", longDescription: "", isLocked: true)], achivements: [:], gameCharacters: currentCharactersInfo)
//더미데이터에 들어간 히스토리나 업적들은 오류를 안뜨게 하기 위해서 일부러 넣어놓은 값들. 수정해도 됨.

var timer:Timer!
