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
    @IBOutlet var nameAndChat: UIStackView!
    
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
        chatView.layer.cornerRadius = 22.41
        // 뷰의 세 모서리만 cornerRadus 값 적용되게 하는 코드
        chatView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func myTextCellUpdate(name:GameCharacterID,chat:String,profile:CharacterFace, godchat : Bool){
        profileNickname.text = name.info().name
        chatText.text = chat
        
        switch profile {
        case .none:
//            nameAndChat.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17).isActive = true
            profileImage.isHidden = true
            profileNickname.isHidden = true
        default:
            profileImage.isHidden = false
            profileNickname.isHidden = false
        }
        switch godchat {
        case true:
            profileNickname.textColor = .black
            backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
            chatView.layer.borderColor = UIColor(red: 0.408, green: 0.522, blue: 0.617, alpha: 1).cgColor
        case false:
            profileNickname.textColor = .white
            backgroundColor =  UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
        }
        let face = findFaceImage(nickname: name, profile: profile, normalProfile: "none")
        profileImage.image = UIImage(named: face)
    }
}
