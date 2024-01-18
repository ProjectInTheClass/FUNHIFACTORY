//
//  Chat.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

struct Chat: Codable {
  let text: String
  let image: String
  let type: ChatType
  let who: GameCharacterID
  let characterFace : CharacterFace
  let optionalOption: OptionalOption?
  let animationOption : ScreenAnimation
  let isGod : Bool
}

enum ChatType: String, Codable{
  case onlyText
  case untouchableImage
  case sectionHeader
  case choice
  case monologue
  case ar
  case startGodChat
  case endGodChat
}

extension Chat {
  
  init(text_ : String, image_ : String, type_ : ChatType, who_ : GameCharacterID, characterFace_ : CharacterFace, optionalOption_ : OptionalOption?, animationOption_ : ScreenAnimation, isGod_ : Bool) {
    text = text_
    image = image_
    type = type_
    who = who_
    characterFace = characterFace_
    optionalOption = optionalOption_
    animationOption = animationOption_
    isGod = isGod_
  }
    
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    text = (try? values.decode(String.self, forKey: .text)) ?? ""
    image = (try? values.decode(String.self, forKey: .image)) ?? ""
    type = (try? values.decode(ChatType.self, forKey: .type)) ?? .onlyText
    who = (try? values.decode(GameCharacterID.self, forKey: .who)) ?? .danhee
    characterFace = (try? values.decode(CharacterFace.self, forKey: .characterFace)) ?? .basic
    optionalOption = (try? values.decode(OptionalOption.self, forKey: .optionalOption))
    animationOption = (try? values.decode(ScreenAnimation.self, forKey: .animationOption)) ?? .none
    isGod = (try? values.decode(Bool.self, forKey: .isGod)) ?? false
  }
}

enum ArId: String, Codable {
  case hidePocketInGround
  case hidePocketBetweenRocks
}
