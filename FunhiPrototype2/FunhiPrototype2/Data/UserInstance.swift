//
//  UserInstance.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/30.
//

import Foundation

var player = User(setting: playerSetting, currentEpisodes: [prologueChapter,testChapter1,testChapter2,testChapter3,testChapter4], currentCharacterInfo: currentCharactersInfo, currentAchievementInfo: [], dayIndex: 0, dayId: "day0", currentChatId: "001")


var playerSetting = Setting(bgmVolume: 0.5, effectVolume: 0.0, textSpeed: 1.0)

let dummyData = GameData(stories: ["day0":test], histories: [1:NoteCase(id: "", title: "", shortDescription: "", longDescription: "", isLocked: true)], achivements: [:], gameCharacters: currentCharactersInfo)
//더미데이터에 들어간 히스토리나 업적들은 오류를 안뜨게 하기 위해서 일부러 넣어놓은 값들. 수정해도 됨.

var timer:Timer!
