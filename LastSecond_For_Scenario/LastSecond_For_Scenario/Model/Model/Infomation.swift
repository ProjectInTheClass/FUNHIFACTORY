//
//  Infomation.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

class Infomation: Codable {
  var infomationID: InfomationID
  var isLocked: Bool = false
  var text: String
  
  init(infomationID: InfomationID, isLocked: Bool, text: String) {
    self.infomationID = infomationID
    self.isLocked = isLocked
    self.text = text
  }
}

enum InfomationID: String, Codable {
  case hwiryeong1
  case hwiryeong2
  case hwiryeong3
  case hwiryeong4
  case hwiryeong5
  case teacher1
  case teacher2
  case teacher3
  case teacher4
  case leegyi1
  case leegyi2
  case kimjajeom1
  case kimjajeom2
  case kimjajeom3
  case kimsanggung1
  case kimsanggung2
  case kimsanggung3
  case kimsanggung4
  case kimsanggung5
  case kimsanggung6
}
