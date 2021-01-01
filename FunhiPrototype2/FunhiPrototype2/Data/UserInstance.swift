//
//  UserInstance.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/30.
//

import Foundation

var player = User(setting: playerSetting, currentEpisodes: [prologueChapter,testChapter1,testChapter2,testChapter3,testChapter4], currentCharacterInfo: currentCharactersInfo, dayIndex: 0, dayId: "day0", currentChatId: "096")

var playerSetting = Setting(bgmVolume: 0.5, effectVolume: 0.0, textSpeed: 10.0)

let dummyData = GameData(stories: [test], histories: [:], achivements: [:], gameCharacters: currentCharactersInfo)


var timer:Timer!
