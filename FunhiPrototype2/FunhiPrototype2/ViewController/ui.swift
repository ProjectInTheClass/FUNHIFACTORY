//
//  ui.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/04.
//

import Foundation
import UIKit

func maingameNotepopupViewDesign(popupView: UIView) {
    popupView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    popupView.layer.cornerRadius = 4
    popupView.layer.borderWidth = 1.3
    popupView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
}

func monologueUI(cell : UIView){
    cell.layer.borderColor = CGColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.0)
}

func choiceCollectionViewBorder(choiceView : UIView){
    choiceView.layer.borderColor = CGColor(red: 0.746, green: 0.746, blue: 0.746, alpha: 1)
}
