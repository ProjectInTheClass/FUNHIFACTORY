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
        chatText.setLineSpacing(lineSpacing: 6)
        chatView.layer.borderWidth = 1.5
        chatView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        chatView.layer.cornerRadius = 20
        chatView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    func myTextCellUpdate(name:String,chat:String,profile:CharacterFace){
        profileNickname.text = name
        chatText.text = chat
        var face : String {
            switch profile {
            case .none: return "none"
            case .angry1: return "danhee angry face 1"
            case .angry2: return "danhee angryface 2"
            case .basic:   return "danhee basic face"
            case .cry1: return " danhee cry face 1"
            case .cry2: return " danhee cry face 2"
            case .happy1:  return "danhee happy face 1"
            case .happy2:   return "danhee happy face 2"
            case .happy3:   return "danhee happy face 3"
            case .sad:  return "danhee sad face"
            case .scared:   return "danhee scared face"
            case .straight: return "danhee straight face"
            case .surprise1:   return "danhee surprised face 1"
            case .surprise2:    return "danhee surprised face 2"
            case .surprise3:    return "danhee surprised face 3"
            }
        }
        if face == "none"{
            profileImage.isHidden = true
            profileNickname.isHidden = true
            chatView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7).isActive = true
            contentView.layoutIfNeeded()
        } else {
            chatView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 57).isActive = true
            contentView.layoutIfNeeded()
        }
        profileImage.image = UIImage(named: face)
        return
    }
}
