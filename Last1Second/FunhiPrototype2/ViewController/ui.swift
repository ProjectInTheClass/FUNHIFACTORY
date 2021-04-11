//
//  ui.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/04.
//

import Foundation
import UIKit

func maingameNotepopupViewDesign(popupView: UIView, parentView: UIView) {
    
    parentView.addSubview(popupView)
    popupView.translatesAutoresizingMaskIntoConstraints = false
    popupView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    popupView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    popupView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
    popupView.topAnchor.constraint(equalTo: parentView.topAnchor, constant: -70).isActive = true

    
    popupView.layer.cornerRadius = 4
    popupView.layer.borderWidth = 1.3
    popupView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
}

func monologueUI(cell : UIView){
    cell.layer.borderWidth = 1.5
    cell.layer.borderColor = UIColor(red: 0.785, green: 0.872, blue: 0.942, alpha: 1).cgColor
}

func choiceCollectionViewBorder(choiceView : UIView){
    choiceView.layer.borderColor = CGColor(red: 0.746, green: 0.746, blue: 0.746, alpha: 1)
}

func chatToGodUIUpdate(hwiryeong view : UIView){
    /*
     let shadows = UIView()
     shadows.frame = CGRect(x: 0, y: 0, width: 55, height: 55)
     shadows.clipsToBounds = false
     view.addSubview(shadows)
     
     let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
     let layer0 = CALayer()
     layer0.shadowPath = shadowPath0.cgPath
     layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
     layer0.shadowOpacity = 1
     layer0.shadowRadius = 12
     layer0.shadowOffset = CGSize(width: 0, height: 0)
     layer0.bounds = shadows.bounds
     layer0.position = shadows.center
     shadows.layer.addSublayer(layer0)
     view.translatesAutoresizingMaskIntoConstraints = false
     view.sendSubviewToBack(shadows)
     */
    view.layer.shadowColor = UIColor(red: 0.635, green: 0.765, blue: 0.863, alpha: 1).cgColor

    view.layer.shadowOpacity = 1

    view.layer.shadowRadius = 15

    view.layer.shadowOffset = CGSize(width: 0, height: 0)
}
func choiceCellUIUpdate(target view : UIView){
  

    view.layer.cornerRadius = 20
    view.translatesAutoresizingMaskIntoConstraints = false
    //view.widthAnchor.constraint(equalToConstant: 344).isActive = true
    //view.heightAnchor.constraint(equalToConstant: 45).isActive = true
   
}
extension UIView {
    func clearConstraints() {
        for subview in self.subviews {
            subview.clearConstraints()
        }
        self.removeConstraints(self.constraints)
    }
}
