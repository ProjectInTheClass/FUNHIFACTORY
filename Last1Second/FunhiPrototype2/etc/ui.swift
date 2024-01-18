//
//  ui.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/04.
//

import Foundation
import UIKit


func monologueUI(cell : UIView){
  cell.layer.borderWidth = 1.5
  cell.layer.borderColor = UIColor(red: 0.785, green: 0.872, blue: 0.942, alpha: 1).cgColor
}

func choiceCollectionViewBorder(choiceView : UIView){
  choiceView.layer.borderColor = CGColor(red: 0.746, green: 0.746, blue: 0.746, alpha: 1)
}

func chatToGodUIUpdate(hwiryeong view : UIView){
  view.layer.shadowColor = UIColor(red: 0.635, green: 0.765, blue: 0.863, alpha: 1).cgColor
  view.layer.shadowOpacity = 1
  view.layer.shadowRadius = 15
  view.layer.shadowOffset = CGSize(width: 0, height: 0)
}
