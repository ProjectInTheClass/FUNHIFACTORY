//
//  UserInstance.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/30.
//

import Foundation

var player = User(setting: playerSetting, tickets: 0, currentHistories: [], currentAchievements: [], currentCharacterInfo: currentCharactersInfo, dayIndex: 0, dayId: "day0", currentChatId: "096")

var playerSetting = Setting(bgmVolume: 0.5, effectVolume: 0.0, textSpeed: 10.0)

let dummyData = Data(stories: ["day0":test], histories: [1:History(title: "", shortDescription: "", longDescription: "")], achivements: [1:.charonsInterrogation], gameCharacters: currentCharactersInfo)

var timer:Timer!
