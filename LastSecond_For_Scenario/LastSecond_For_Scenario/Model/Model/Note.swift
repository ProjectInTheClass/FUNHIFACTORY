//
//  Note.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

class NoteCase: Codable{
  let id: NoteCaseID
  let title: String
  let shortDescription: String
  let longDescription: String
  var isLocked: Bool = true
  var isChecked: Bool = true
  
  init(id: NoteCaseID, title: String, shortDescription: String, longDescription: String) {
    self.id = id
    self.title = title
    self.shortDescription = shortDescription
    self.longDescription = longDescription
  }
}

enum NoteCaseID: String,Codable{
  case case001
  
  case case101
  
  case gwanghae
  case king_gwanghae
  case badguy_gwanghae
  case injo_revolt_background
  case injo_revolt_day
  case injo_revolt_after
  
  case case301
  
  case case401
}
