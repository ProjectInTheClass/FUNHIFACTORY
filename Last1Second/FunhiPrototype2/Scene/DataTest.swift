//
//  DataTest.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/12.
//

import Foundation

/// 앱 데이터 바꿔서 테스트 필요할 시 사용하는 함수.  (ex) chatHistory에 임시 데이터를 넣고 싶음 / 프롤로그 isCleared를 true로 바꿔두고 빌드하고 싶음 등등 )  반드시!!! 앱스토어 올릴 땐 함수 호출한 곳 주석처리해야 함!!!
func testData() {
  player.currentEpisodes[0].chatHistory = [Chat(text_: "", image_: "", type_: .onlyText, who_: .danhee, characterFace_: .angry1, optionalOption_: nil, animationOption_: .none, isGodChat_: false)]
    player.currentEpisodes[2].currentCharacterNote[1].isLocked = false
}
