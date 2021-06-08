//
//  pauseBarAlert.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/06/07.
//

import UIKit

extension mainGameViewController{
    
    func alertOnDesign(target : UIView)
    {
        let redCircle = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        target.layer.backgroundColor = UIColor(red: 1, green: 0.865, blue: 0.855, alpha: 1).cgColor
        target.layer.borderColor = UIColor(red: 1, green: 0.6, blue: 0.571, alpha: 1).cgColor
        redCircle.image = UIImage(named: "red_emergency")
        target.addSubview(redCircle)
        redCircle.tag = 1
        //더 안에 집어넣어야 할 듯? 그냥 바로 넣으면 삭제할 때 힘듦
        redCircle.translatesAutoresizingMaskIntoConstraints = false
        redCircle.widthAnchor.constraint(equalToConstant: 16).isActive = true
        redCircle.heightAnchor.constraint(equalToConstant: 16).isActive = true
        redCircle.leftAnchor.constraint(equalTo: target.leftAnchor, constant: 31).isActive = true
        redCircle.bottomAnchor.constraint(equalTo: target.bottomAnchor, constant: -28.5).isActive = true
    }
    
    func alertOffDesign(target : UIView)
    {
        target.layer.borderColor = UIColor(red: 0.524, green: 0.646, blue: 0.75, alpha: 1).cgColor
        target.layer.backgroundColor = UIColor(red: 0.743, green: 0.817, blue: 0.879, alpha: 1).cgColor
        for view in target.subviews {
            if view.tag == 1
            {
                view.removeFromSuperview()
            }
        }
    }
    
    func buttonAlertOn(input : Int)
    {
        switch input {
        // 0 : note, 1 : album, 2 : timeline
        case 0:
            alertOnDesign(target: floatingButtons[2])
        case 1:
            alertOnDesign(target: floatingButtons[3])
        case 2:
            alertOnDesign(target: floatingButtons[4])
        default:
            print("")
        }
    }
    
    func buttonAlertOff(input : Int)
    {
        switch input {
        // 0 : note, 1 : album, 2 : timeline
        case 0:
            alertOffDesign(target: floatingButtons[2])
        case 1:
            alertOffDesign(target: floatingButtons[3])
        case 2:
            alertOffDesign(target: floatingButtons[4])
        default:
            print("")
        }
    }
}
