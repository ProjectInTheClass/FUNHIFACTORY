//
//  TutorialModel.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/16.
//

import Foundation

class TutorialModel {
  // 대화 지도 수첩 탐라 앨범 홈
  static var homeOpened = false
  static var maingameOpened = false
  static var noteOpened = false
  static var albumOpened = false
  static var isTimelineTutorialOpeneded = false
  static var isMapTutorialOpeneded = false
  
}


enum TutorialStyle {
  case singleImage(image: String, desc: String)
  case doubleImages(image1: String, image2: String, desc: String)
  case singleFillImage(image: String, desc: String)
}

let sampleData: [TutorialStyle] = [
  .singleImage(image: "argument", desc: "singleImage"),
  .doubleImages(image1: "argument", image2: "argument", desc: "doubleImages"),
  .singleFillImage(image: "argument", desc: "singleFillImage"),
]
