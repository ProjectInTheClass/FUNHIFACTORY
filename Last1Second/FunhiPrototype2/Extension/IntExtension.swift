//
//  IntExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/07.
//

import Foundation

extension Int {
  
  func toTimelineIndex() -> Int {
    var timelineIndex = Int()
    switch self {
    case 0:
        timelineIndex = self
    case 2...5:
        timelineIndex = self - 1
    case 7:
        timelineIndex = self - 2
    default:
        timelineIndex = 0
    }
    return timelineIndex
  }
  
}
