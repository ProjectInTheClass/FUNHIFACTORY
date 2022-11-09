//
//  Choice.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

struct Choice: Codable {
  let text: String
  let chatType: ChatType
  let who: GameCharacterID
  let characterFace : CharacterFace
  let nextTextIndex: String
  let optionalOption: OptionalOption?
}

extension Choice {
  
  init(text_ : String, who_: GameCharacterID, chatType_ : ChatType, characterFace_ : CharacterFace, nextTextIndex_ : String,optionalOption_ : OptionalOption?) {
    text = text_
    chatType = chatType_
    characterFace = characterFace_
    optionalOption = optionalOption_
    nextTextIndex = nextTextIndex_
    who = who_
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    text = (try? values.decode(String.self, forKey: .text)) ?? ""
    chatType = (try? values.decode(ChatType.self, forKey: .chatType)) ?? .onlyText
    characterFace = (try? values.decode(CharacterFace.self, forKey: .characterFace)) ?? .basic
    nextTextIndex = (try? values.decode(String.self, forKey: .nextTextIndex)) ?? "001"
    optionalOption = (try? values.decode(OptionalOption.self, forKey: .optionalOption))
    who = (try? values.decode(GameCharacterID.self, forKey: .who)) ?? .currentEpDanhee
  }
}
