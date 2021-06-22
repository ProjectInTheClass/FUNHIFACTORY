//
//  opTextTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class opTextTableViewCell: UITableViewCell {
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
        profileNickname.font = UIFont(name: "NanumSquareEB", size: 18)
        chatText.font = UIFont(name: "NanumSquareB", size: 17)
        chatView.layer.borderWidth = 1.7
        chatView.layer.borderColor = UIColor(red: 0.707, green: 0.76, blue: 0.804, alpha: 1).cgColor
        chatView.layer.cornerRadius = 25
        chatView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
   
    func opTextCellUpdate(name:GameCharacterID,chat:String, normalProfile:String, mainProfile:CharacterFace, isLocked : Bool, godchat : Bool){
        profileNickname.text = name.info().name
                if isLocked == true{
                    profileNickname.text = "???"
                }
        chatText.text = chat

        switch mainProfile {
        case .none:
            //chatView.removeConstraint(chatView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 64))
            profileImage.isHidden = true
            profileNickname.isHidden = true
        default:
            profileNickname.isHidden = false
            profileImage.isHidden = false
        }
        switch godchat {
        case true:
            profileNickname.textColor = .black
            backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
        case false:
            profileNickname.textColor = .white
            backgroundColor =  UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
        }
        let face = findFaceImage(nickname: name, profile: mainProfile, normalProfile: normalProfile)
        profileImage.image = UIImage(named: face)
    }
}
