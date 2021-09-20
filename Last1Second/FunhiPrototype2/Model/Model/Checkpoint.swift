//
//  Checkpoint.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import Foundation

struct CheckPoint: Codable {
  let id: CheckPointID
  let name: String
  //블럭 인덱스 : 체크포인트가 어떤 인덱스
  let storyBlockIndex: String
  var isLocked: Bool
}

enum CheckPointID: String, Codable {
  case checkPoint_0_0_1
  case checkPoint_0_0_2
  case checkPoint_0_0_3
  
  case checkPoint_2_0_1
  case checkPoint_2_0_2
  case checkPoint_2_0_3
  case checkPoint_2_1_1
  case checkPoint_2_1_2
  case checkPoint_2_1_3
  case checkPoint_2_2_1
  case checkPoint_2_2_2
  case checkPoint_2_2_3
}
