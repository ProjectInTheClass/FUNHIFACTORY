//
//  Achievenent.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

struct Achievement: Codable {
  let name: String
  let image: String
  let id: AchievementID
  var isLocked: Bool = true
  var isChecked: Bool = Bool()
}

enum AchievementID: String, Codable {
  /// 프롤로그
  case donhwamun
  case geumcheongyo
  case injeongjeon
  case cat
  case parents
  case necklace_0
  case liar
  case huijeongdang
  case huwon_garden
  case revolt
}
