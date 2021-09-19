//
//  UIColorExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/14.
//

import UIKit

extension UIColor {
  
  func codable() -> CodableColor {
    return CodableColor(color: self)
  }
  
  static let way0TrackColor = UIColor(named: "way0Track")!
  static let way0ProgressColor = UIColor(named: "way0Progress")!
  static let way0CircleColor = UIColor(named: "way0Circle")!

  static let way1TrackColor = UIColor(named: "way1Track")!
  static let way1ProgressColor = UIColor(named: "way1Progress")!
  static let way1CircleColor = UIColor(named: "way1Circle")!
  
  static let way2TrackColor = UIColor(named: "way2Track")!
  static let way2ProgressColor = UIColor(named: "way2Progress")!
  static let way2CircleColor = UIColor(named: "way2Circle")!
  
  static let checkWay0Background = UIColor(named: "way0CheckBackground")!
  static let checkWay0Shadow = UIColor(named: "way0CheckShadow")!
  
  static let checkWay1Background = UIColor(named: "way1CheckBackground")!
  static let checkWay1Shadow = UIColor(named: "way1CheckShadow")!
  static let checkWay1Section = UIColor(named: "way1CheckSection")!
  
  static let checkWay2Background = UIColor(named: "way2CheckBackground")!
  static let checkWay2Shadow = UIColor(named: "way2CheckShadow")!
  static let checkWay2Section = UIColor(named: "way2CheckSection")!
  
  static let way0LockedBackground = UIColor(named: "way0LockedBackground")
  static let way0LockedShadow = UIColor(named: "way0LockedShadow")
  
  static let way1LockedBackground = UIColor(named: "way1LockedBackground")
  static let way1LockedShadow = UIColor(named: "way1LockedShadow")
  
  static let way2LockedBackground = UIColor(named: "way2LockedBackground")
  static let way2LockedShadow = UIColor(named: "way2LockedShadow")
}
