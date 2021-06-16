//
//  monologueTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/08.
//

import UIKit

class monologueTableViewCell: UITableViewCell {
    @IBOutlet var monologueText: UILabel!
    @IBOutlet var monologueCell: UIView!
    @IBOutlet var monologueView: UIView!
    @IBOutlet var monologueCircle: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name.font = UIFont(name: "NanumSquareEB", size: 18)
        monologueText.font = UIFont(name: "NanumSquareB", size: 17)
        monologueUI(cell: monologueCell)
        monologueUI(cell: monologueCircle)
    }
    func chatUpdate(nickname:String, profile:CharacterFace){
        name.text = nickname
        var face : String {
            switch profile {
            case .none: return "none"
            case .angry1: return "prologue danhee angry 1"
            case .angry2: return "prologue danhee angry 2"
            case .basic:   return "prologue danhee basic"
            case .cry1: return " prologue danhee cry 1"
            case .cry2: return " prologue danhee cry 2"
            case .happy1:  return "prologue danhee happy 1"
            case .happy2:   return "prologue danhee happy 2"
            case .happy3:   return "prologue danhee happy 3"
            case .sad1:  return "prologue danhee sad 1"
            case .cryangry1: return "prologue danhee sad&angry 1"
            case .cryangry2: return "prologue danhee sad&angry 2"
            case .scared:   return "prologue danhee scared"
            case .straight: return "prologue danhee straight"
            case .surprise1:   return "prologue danhee surprise 1"
            case .surprise2:    return "prologue danhee surprise 2"
            default :
                return "none"
            }
        }
        if face == "none"{
            profileImage.isHidden = true
            name.isHidden = true
        }
        profileImage.image = UIImage(named: face)
        return
    }
}
