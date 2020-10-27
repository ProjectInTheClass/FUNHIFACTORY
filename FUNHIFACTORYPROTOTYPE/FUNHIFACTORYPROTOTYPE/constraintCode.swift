//
//  constraintCode.swift
//  FUNHIFACTORYPROTOTYPE
//
//  Created by 손영웅 on 2020/10/27.
//

import Foundation
import UIKit
func giveAll0ToView(viewA : UIView, targetView : UIView){
    viewA.translatesAutoresizingMaskIntoConstraints = false
            viewA.topAnchor.constraint(equalTo: targetView.topAnchor,constant: 0).isActive = true // ---- 1
            viewA.leftAnchor.constraint(equalTo: targetView.leftAnchor, constant: 0).isActive = true // ---- 2
            viewA.rightAnchor.constraint(equalTo: targetView.rightAnchor, constant: 0).isActive = true // ---- 3
    viewA.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 0).isActive = true // ---- 4
}

func titleLabelConstraint(titleLabel : UIView, note : UIView){
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: note.topAnchor,constant: 14).isActive = true
    titleLabel.leftAnchor.constraint(equalTo: note.leftAnchor, constant: 13).isActive = true // ---- 2
    titleLabel.rightAnchor.constraint(equalTo: note.rightAnchor, constant: 13).isActive = true // ---- 3
}
func informationLabelConstraint(titleLabel : UIView, informationLabel : UIView, note : UIView){
    informationLabel.translatesAutoresizingMaskIntoConstraints = false
    informationLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: 1).isActive = true
    informationLabel.leftAnchor.constraint(equalTo: note.leftAnchor, constant: 13).isActive = true // ---- 2
    informationLabel.rightAnchor.constraint(equalTo: note.rightAnchor, constant: 13).isActive = true // ---- 3
    informationLabel.bottomAnchor.constraint(equalTo: note.bottomAnchor, constant: 12).isActive = true // ---- 4
}
