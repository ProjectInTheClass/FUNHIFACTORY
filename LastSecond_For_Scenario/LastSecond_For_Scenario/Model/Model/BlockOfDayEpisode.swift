//
//  BlockOfDayEpisode.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

struct BlockOfDayEpisode: Codable {
  let chats: [Chat]
  let choices: [Choice]
  let choiceSkip : Bool
  let isGodChat : Bool
  let backGroundMusic : Bgm
  let currentRoute : Route
}

struct BlockOfDayEpisodeForJson: Codable {
  let id : String
  let chats: [Chat]
  let choices: [Choice]
  let choiceSkip : Bool
  let isGodChat : Bool
  let backGroundMusic : Bgm
  let currentRoute : Route
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    id = (try? values.decode(String.self, forKey: .id)) ?? ""
    chats = (try? values.decode([Chat].self, forKey: .chats)) ?? []
    choices = (try? values.decode([Choice].self, forKey: .choices)) ?? []
    choiceSkip = (try? values.decode(Bool.self, forKey: .choiceSkip)) ?? false
    isGodChat = (try? values.decode(Bool.self, forKey: .isGodChat)) ?? false
    backGroundMusic = (try? values.decode(Bgm.self, forKey: .backGroundMusic)) ?? .none
    currentRoute   = (try? values.decode(Route.self, forKey: .currentRoute)) ?? .normal
  }
}
