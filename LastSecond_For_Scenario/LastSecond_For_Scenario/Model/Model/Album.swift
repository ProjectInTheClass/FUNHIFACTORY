//
//  Album.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

class AlbumImage: Codable {
   
  let id: AlbumImageID
  let image: String
  let title: String
  let description: String
  var isLocked: Bool = true
  var isChecked: Bool = true
  
  init(id: AlbumImageID, image: String, title: String, description: String, isLocked: Bool) {
    self.id = id
    self.image = image
    self.title = title
    self.description = description
    self.isLocked = isLocked
  }
}

enum AlbumImageID: String, Codable {
  // case는 가독성 좋게 하나하나 만드는 게 좋다고 희종쌤께 피드백 들은 적 있음
  case donhwamun_with_danhee
  case drawing_geumcheongyo
  case drawing_injeongjeon
  case prolog_danhee
  case prolog_hwiryeong
  case necklace_in_hand
  case conference_hall
  case bribe
  case huijeongdang_fire
  case huwon_garden_fire
  case revolt_image
    
  func info() -> AlbumImage{
    switch self {
    case .donhwamun_with_danhee:
      return player.currentEpisodes[0].currentAlbumImages[0]
    case .drawing_geumcheongyo:
      return player.currentEpisodes[0].currentAlbumImages[1]
    case .drawing_injeongjeon:
      return player.currentEpisodes[0].currentAlbumImages[2]
    case .necklace_in_hand:
      return player.currentEpisodes[0].currentAlbumImages[3]
    case .prolog_danhee :
      return player.currentEpisodes[0].currentAlbumImages[4]
    case .prolog_hwiryeong :
      return player.currentEpisodes[0].currentAlbumImages[5]
    case .conference_hall:
      return player.currentEpisodes[2].currentAlbumImages[0]
    case .bribe:
      return player.currentEpisodes[2].currentAlbumImages[1]
    case .huijeongdang_fire:
      return player.currentEpisodes[2].currentAlbumImages[2]
    case .huwon_garden_fire:
      return player.currentEpisodes[2].currentAlbumImages[3]
    case .revolt_image:
      return player.currentEpisodes[3].currentAlbumImages[4]
    }
  }
}
