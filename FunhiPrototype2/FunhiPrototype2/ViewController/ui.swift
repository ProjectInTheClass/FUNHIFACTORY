//
//  ui.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/04.
//

import Foundation
import UIKit

func topBarShadow(wholeView : UIView, buttonView:UIView, tableview:UIView){
    let view = UILabel()
    view.frame = CGRect(x: 0, y: 0, width: 434, height: 61)
    view.backgroundColor = .clear

    let shadows = UIView()
    shadows.frame = view.frame
    shadows.clipsToBounds = false
    view.addSubview(shadows)


    let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
    let layer0 = CALayer()
    layer0.shadowPath = shadowPath0.cgPath
    layer0.shadowColor = UIColor(red: 0, green: 0.11, blue: 0.208, alpha: 1).cgColor
    layer0.shadowOpacity = 1
    layer0.shadowRadius = 26
    layer0.shadowOffset = CGSize(width: 0, height: 12)
    layer0.bounds = shadows.bounds
    layer0.position = shadows.center
    shadows.layer.addSublayer(layer0)

    let shapes = UIView()
    shapes.frame = view.frame
    shapes.clipsToBounds = true
    view.addSubview(shapes)

    let layer1 = CALayer()
    layer1.backgroundColor = UIColor(red: 0.123, green: 0.201, blue: 0.271, alpha: 1).cgColor
    layer1.bounds = shapes.bounds
    layer1.position = shapes.center
    shapes.layer.addSublayer(layer1)

    let parent = wholeView
    parent.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.widthAnchor.constraint(equalToConstant: 414).isActive = true
    view.heightAnchor.constraint(equalToConstant: 61).isActive = true
    view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
    view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 44).isActive = true
    view.bottomAnchor.constraint(equalTo: tableview.topAnchor, constant: 0).isActive = true
    wholeView.bringSubviewToFront(buttonView)
}

func maingameNotepopupViewDesign(popupView: UIView) {
    popupView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    popupView.layer.cornerRadius = 4
    popupView.layer.borderWidth = 1.3
    popupView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
}

func monologueUI(cell : UIView){
    cell.layer.borderColor = CGColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.0)
}
