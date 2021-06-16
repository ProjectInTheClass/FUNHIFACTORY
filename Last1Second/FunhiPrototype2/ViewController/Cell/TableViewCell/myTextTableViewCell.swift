//
//  myTextTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class myTextTableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileNickname: UILabel!
    @IBOutlet var chatText: UILabel!
    @IBOutlet var chatView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
        
        // Initialization code
    }
    func designCell() {
        profileNickname.font = UIFont(name: "NanumSquareEB", size: 18)
        chatText.font = UIFont(name: "NanumSquareB", size: 17)
        chatText.setLineSpacing(lineSpacing: 6)
        chatView.layer.borderWidth = 1.7
        chatView.layer.borderColor = UIColor(red: 0.319, green: 0.457, blue: 0.575, alpha: 1).cgColor
        chatView.layer.cornerRadius = 20
        // 뷰의 세 모서리만 cornerRadus 값 적용되게 하는 코드
        chatView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func myTextCellUpdate(name:String,chat:String,profile:CharacterFace){
        profileNickname.text = name
        chatText.text = chat
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
            profileNickname.isHidden = true
        }
        profileImage.image = UIImage(named: face)
        return
    }
}
